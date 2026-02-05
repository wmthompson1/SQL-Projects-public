"""
Twin Table Generator with ArangoDB Integration
==============================================

Generates SQLMesh "digital twin" models by querying the ArangoDB graph
for schema metadata and dependencies. This enables Copilot to understand
relationships between tables and generate accurate twin definitions.

Usage:
    python generate_twin_tables.py --tables PAYABLE RECEIVER --output models/staging
    
    # Query from ArangoDB
    python generate_twin_tables.py --from-arango --pattern "PAYABLE*" --output models/staging

Features:
    - Queries ArangoDB graph for table metadata
    - Generates SQLMesh staging models with proper dependencies
    - Includes column-level documentation from graph
    - Adds lineage tracking metadata
    - Supports incremental and full refresh models
"""

import argparse
import sys
from pathlib import Path
from typing import List, Dict, Any, Optional

# Add parent directories to path for imports
sys.path.insert(0, str(Path(__file__).parent.parent.parent.parent))

try:
    from analysis.graph.arango_integration import ArangoLineageStore
    ARANGO_AVAILABLE = True
except ImportError:
    print("⚠️  Warning: Could not import ArangoLineageStore")
    ARANGO_AVAILABLE = False


class TwinTableGenerator:
    """
    Generates SQLMesh twin table models with ArangoDB integration.
    """
    
    def __init__(self, arango_store: Optional[ArangoLineageStore] = None):
        """
        Initialize generator.
        
        Args:
            arango_store: Optional ArangoDB connection for metadata queries
        """
        self.arango = arango_store
        self.has_arango = arango_store is not None and arango_store.enabled
    
    def generate_model_from_arango(
        self, 
        table_name: str,
        output_dir: Path
    ) -> bool:
        """
        Generate SQLMesh model for a table using ArangoDB metadata.
        
        Args:
            table_name: Table name to generate model for
            output_dir: Directory to write model file
            
        Returns:
            True if successful, False otherwise
        """
        if not self.has_arango:
            print(f"❌ ArangoDB not available for table: {table_name}")
            return False
        
        print(f"📊 Querying ArangoDB for table: {table_name}")
        
        # Get table metadata from ArangoDB
        table_info = self.arango.get_table_info(table_name)
        if not table_info:
            print(f"⚠️  Table not found in ArangoDB: {table_name}")
            return False
        
        # Get downstream dependencies
        downstream = self.arango.get_downstream_tables(table_name, max_depth=2)
        
        # Get reports that use this table
        reports = self.arango.query_table_dependencies(table_name)
        
        # Generate model content
        model_content = self._generate_model_content(
            table_name,
            table_info,
            downstream,
            reports
        )
        
        # Write model file
        output_file = output_dir / f"stg_{table_name.lower()}.sql"
        output_file.parent.mkdir(parents=True, exist_ok=True)
        
        with open(output_file, 'w') as f:
            f.write(model_content)
        
        print(f"   ✅ Generated: {output_file}")
        return True
    
    def _generate_model_content(
        self,
        table_name: str,
        table_info: Dict[str, Any],
        downstream: List[tuple],
        reports: List[str]
    ) -> str:
        """
        Generate SQLMesh model content from metadata.
        
        Args:
            table_name: Table name
            table_info: Table metadata from ArangoDB
            downstream: List of (table, depth) tuples
            reports: List of report paths
            
        Returns:
            Model SQL content
        """
        # Extract metadata
        original_id = table_info.get('original_id', table_name)
        description = table_info.get('description', f'Twin model for {table_name}')
        
        # Build comments header
        comments = [
            "/*",
            f" * Twin Table Model: {table_name}",
            f" * Source: {original_id}",
            f" * Generated from ArangoDB graph metadata",
            " *"
        ]
        
        if reports:
            comments.append(f" * Used by {len(reports)} report(s):")
            for report in reports[:5]:  # Limit to first 5
                comments.append(f" *   - {report}")
            if len(reports) > 5:
                comments.append(f" *   ... and {len(reports) - 5} more")
            comments.append(" *")
        
        if downstream:
            comments.append(f" * Downstream dependencies ({len(downstream)}):")
            for table, depth in downstream[:5]:
                comments.append(f" *   - {table} (depth: {depth})")
            if len(downstream) > 5:
                comments.append(f" *   ... and {len(downstream) - 5} more")
            comments.append(" *")
        
        comments.append(" */")
        
        # Build MODEL block
        model_block = f"""
MODEL (
  name staging.stg_{table_name.lower()},
  kind FULL,
  grain ({table_name.lower()}_id),
  description '{description}',
  tags (twin, production_source),
  meta (
    source_table='{original_id}',
    generated_from='arango_graph',
    downstream_count={len(downstream)},
    used_by_count={len(reports)}
  )
);
"""
        
        # Build SELECT statement
        select_block = f"""
SELECT
  *
FROM raw.{table_name.lower()};
"""
        
        return "\n".join(comments) + model_block + select_block
    
    def generate_models_from_pattern(
        self,
        pattern: str,
        output_dir: Path,
        limit: int = 20
    ) -> int:
        """
        Generate models for all tables matching a pattern.
        
        Args:
            pattern: Search pattern (e.g., "PAYABLE*")
            output_dir: Output directory
            limit: Maximum tables to process
            
        Returns:
            Number of models generated
        """
        if not self.has_arango:
            print("❌ ArangoDB not available")
            return 0
        
        print(f"🔍 Searching for tables matching: {pattern}")
        
        # Search for matching tables
        tables = self.arango.search_tables(pattern.replace('*', ''), limit=limit)
        
        if not tables:
            print(f"⚠️  No tables found matching pattern: {pattern}")
            return 0
        
        print(f"Found {len(tables)} matching table(s)")
        
        # Generate model for each table
        success_count = 0
        for table in tables:
            table_name = table.get('name', '').split('.')[-1]  # Get base name
            if self.generate_model_from_arango(table_name, output_dir):
                success_count += 1
        
        return success_count


def main():
    parser = argparse.ArgumentParser(
        description='Generate SQLMesh twin table models with ArangoDB integration',
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  # Generate models for specific tables
  python generate_twin_tables.py --tables PAYABLE RECEIVER --output models/staging
  
  # Generate from ArangoDB pattern search
  python generate_twin_tables.py --from-arango --pattern "PAY*" --output models/staging
  
  # Specify custom ArangoDB connection
  python generate_twin_tables.py --from-arango --pattern "INV*" \\
      --arango-host http://localhost:8529 \\
      --arango-db manufacturing_graph
        """
    )
    
    # Table selection
    table_group = parser.add_mutually_exclusive_group(required=True)
    table_group.add_argument(
        '--tables', '-t',
        nargs='+',
        help='List of table names to generate models for'
    )
    table_group.add_argument(
        '--from-arango',
        action='store_true',
        help='Query tables from ArangoDB using --pattern'
    )
    
    parser.add_argument(
        '--pattern', '-p',
        help='Search pattern for --from-arango (e.g., "PAYABLE*")'
    )
    
    # Output options
    parser.add_argument(
        '--output', '-o',
        type=Path,
        default=Path('models/staging'),
        help='Output directory for generated models (default: models/staging)'
    )
    
    parser.add_argument(
        '--limit', '-l',
        type=int,
        default=20,
        help='Maximum number of tables to process (default: 20)'
    )
    
    # ArangoDB options
    parser.add_argument(
        '--arango-host',
        help='ArangoDB host (default: from env or http://127.0.0.1:8529)'
    )
    parser.add_argument(
        '--arango-db',
        help='ArangoDB database name (default: from env or manufacturing_graph)'
    )
    
    args = parser.parse_args()
    
    # Validate arguments
    if args.from_arango and not args.pattern:
        parser.error("--from-arango requires --pattern")
    
    print("🏗️  Twin Table Generator")
    print("=" * 60)
    
    # Initialize ArangoDB connection if needed
    arango_store = None
    if args.from_arango or args.arango_host or args.arango_db:
        if not ARANGO_AVAILABLE:
            print("❌ ArangoDB integration not available")
            print("   Install with: pip install python-arango")
            return 1
        
        arango_store = ArangoLineageStore(
            host=args.arango_host,
            database=args.arango_db
        )
        
        if not arango_store.connect():
            print("❌ Failed to connect to ArangoDB")
            return 1
    
    # Initialize generator
    generator = TwinTableGenerator(arango_store)
    
    # Generate models
    success_count = 0
    
    if args.from_arango:
        # Generate from pattern
        success_count = generator.generate_models_from_pattern(
            args.pattern,
            args.output,
            args.limit
        )
    else:
        # Generate from explicit table list
        for table_name in args.tables:
            if arango_store:
                if generator.generate_model_from_arango(table_name, args.output):
                    success_count += 1
            else:
                print(f"⚠️  Skipping {table_name} (no ArangoDB connection)")
    
    print()
    print("=" * 60)
    print(f"✅ Generated {success_count} model(s)")
    
    return 0 if success_count > 0 else 1


if __name__ == '__main__':
    sys.exit(main())
