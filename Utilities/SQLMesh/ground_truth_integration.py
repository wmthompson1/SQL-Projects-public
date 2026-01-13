"""
Ground Truth SQL Query Integration for Gradio SQL Generation Endpoint

This module provides utilities to load and serve ground truth SQL queries
for the SQL generation Gradio interface.
"""

import json
from pathlib import Path
from typing import Dict, List, Optional
import re


class GroundTruthQueryManager:
    """Manages ground truth SQL queries for training/reference."""
    
    def __init__(self, queries_file: str = "ground_truth_queries.sql"):
        self.queries_file = Path(queries_file)
        self.queries: List[Dict[str, str]] = []
        self.load_queries()
    
    def load_queries(self) -> None:
        """Parse SQL file and extract categorized queries."""
        if not self.queries_file.exists():
            raise FileNotFoundError(f"Queries file not found: {self.queries_file}")
        
        content = self.queries_file.read_text(encoding='utf-8')
        
        # Split by query delimiter
        raw_queries = content.split('-- ============================================================================')
        
        for raw_query in raw_queries:
            if not raw_query.strip() or 'SCHEMA REFERENCE' in raw_query or 'NOTES FOR' in raw_query:
                continue
            
            query_data = self._parse_query_block(raw_query)
            if query_data:
                self.queries.append(query_data)
    
    def _parse_query_block(self, block: str) -> Optional[Dict[str, str]]:
        """Extract metadata and SQL from a query block."""
        lines = block.strip().split('\n')
        
        metadata = {
            'category': '',
            'natural_language': '',
            'tables': '',
            'sql': ''
        }
        
        sql_lines = []
        in_sql = False
        
        for line in lines:
            if line.startswith('-- QUERY'):
                continue
            elif line.startswith('-- Category:'):
                metadata['category'] = line.replace('-- Category:', '').strip()
            elif line.startswith('-- Natural Language:'):
                metadata['natural_language'] = line.replace('-- Natural Language:', '').strip().strip('"')
            elif line.startswith('-- Tables:'):
                metadata['tables'] = line.replace('-- Tables:', '').strip()
            elif line.strip() and not line.startswith('--'):
                in_sql = True
                sql_lines.append(line)
            elif in_sql and line.strip():
                sql_lines.append(line)
        
        if sql_lines and metadata['natural_language']:
            metadata['sql'] = '\n'.join(sql_lines).strip()
            return metadata
        
        return None
    
    def get_all_queries(self) -> List[Dict[str, str]]:
        """Return all parsed queries."""
        return self.queries
    
    def get_by_category(self, category: str) -> List[Dict[str, str]]:
        """Get queries filtered by category."""
        return [q for q in self.queries if category.lower() in q['category'].lower()]
    
    def search_queries(self, search_term: str) -> List[Dict[str, str]]:
        """Search queries by natural language or SQL content."""
        results = []
        search_lower = search_term.lower()
        
        for query in self.queries:
            if (search_lower in query['natural_language'].lower() or
                search_lower in query['sql'].lower() or
                search_lower in query['category'].lower()):
                results.append(query)
        
        return results
    
    def export_for_gradio(self) -> List[tuple]:
        """Export queries in Gradio dropdown format [(label, value), ...]."""
        return [
            (f"{q['category']}: {q['natural_language']}", q['sql'])
            for q in self.queries
        ]
    
    def export_json(self, output_file: str = "ground_truth_queries.json") -> None:
        """Export queries to JSON format for API consumption."""
        output_path = Path(output_file)
        output_path.write_text(
            json.dumps(self.queries, indent=2, ensure_ascii=False),
            encoding='utf-8'
        )
        print(f"Exported {len(self.queries)} queries to {output_path}")


def integrate_with_gradio_endpoint(manager: GroundTruthQueryManager):
    """
    Example integration with Gradio app.py endpoint.
    
    Add this to your Gradio interface:
    
    ```python
    from ground_truth_integration import GroundTruthQueryManager
    
    query_manager = GroundTruthQueryManager("ground_truth_queries.sql")
    
    # Add dropdown with example queries
    with gr.Row():
        example_queries = gr.Dropdown(
            choices=query_manager.export_for_gradio(),
            label="Example Queries",
            interactive=True
        )
    
    # Auto-populate SQL input when example selected
    example_queries.change(
        fn=lambda sql: sql,
        inputs=[example_queries],
        outputs=[sql_input_box]
    )
    ```
    """
    pass


if __name__ == "__main__":
    # Test the manager
    manager = GroundTruthQueryManager("ground_truth_queries.sql")
    
    print(f"Loaded {len(manager.queries)} queries\n")
    
    # Show all queries
    for i, query in enumerate(manager.queries, 1):
        print(f"\nQuery {i}:")
        print(f"  Category: {query['category']}")
        print(f"  Natural Language: {query['natural_language']}")
        print(f"  Tables: {query['tables']}")
        print(f"  SQL Preview: {query['sql'][:100]}...")
    
    # Export to JSON
    manager.export_json()
    
    print("\n" + "="*80)
    print("Gradio Integration Example:")
    print("="*80)
    print("\nAdd this to hf-space-inventory-sqlgen/app.py:\n")
    print("""
from ground_truth_integration import GroundTruthQueryManager

# Initialize at app startup
query_mgr = GroundTruthQueryManager("../Utilities/SQLMesh/ground_truth_queries.sql")

# In your Gradio interface:
example_dropdown = gr.Dropdown(
    choices=query_mgr.export_for_gradio(),
    label="Load Example Query",
    interactive=True
)
    """)
