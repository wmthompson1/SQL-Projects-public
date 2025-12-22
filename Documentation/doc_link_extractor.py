from bs4 import BeautifulSoup
from pathlib import Path
import re

def extract_links_with_context(html_content, source_file):
    """
    Extract links with surrounding context for AI consumption. 
    """
    soup = BeautifulSoup(html_content, 'lxml')
    links = []
    
    for link in soup.find_all('a', href=True):
        # Get the link details
        href = link['href']
        anchor_text = link.get_text(strip=True)
        
        # Get surrounding context
        parent = link.find_parent(['p', 'li', 'div', 'section'])
        context = parent.get_text(strip=True) if parent else ""
        
        # Get heading context (which section is this in?)
        heading = None
        for tag in link.find_all_previous(['h1', 'h2', 'h3', 'h4', 'h5', 'h6']):
            heading = tag.get_text(strip=True)
            break
        
        links.append({
            'source_file': source_file,
            'href': href,
            'anchor_text': anchor_text,
            'context': context[: 200],  # First 200 chars
            'section_heading': heading,
            'is_internal': not href.startswith(('http://', 'https://', 'mailto:'))
        })
    
    return links

def extract_markdown_links(md_content, source_file):
    """
    Extract links from Markdown with context.
    """
    # Regex for Markdown links:  [text](url)
    pattern = r'\[([^\]]+)\]\(([^\)]+)\)'
    links = []
    
    for match in re.finditer(pattern, md_content):
        anchor_text = match.group(1)
        href = match.group(2)
        
        # Get surrounding context (50 chars before and after)
        start = max(0, match.start() - 50)
        end = min(len(md_content), match.end() + 50)
        context = md_content[start:end]
        
        links.append({
            'source_file': source_file,
            'href': href,
            'anchor_text': anchor_text,
            'context': context,
            'is_internal':  not href.startswith(('http://', 'https://', 'mailto:'))
        })
    
    return links

def build_document_index(root_dir):
    """
    Build AI-optimized document index with link context and graph structure.
    Returns structured index with document map and link graph.
    """
    root = Path(root_dir)
    document_map = {}
    link_graph = {'nodes': [], 'edges': []}
    
    # Collect all markdown files
    md_files = list(root.rglob('*.md'))
    
    for md_file in md_files:
        relative_path = str(md_file.relative_to(root))
        
        # Skip if already processed
        if relative_path in document_map:
            continue
        
        content = md_file.read_text(encoding='utf-8')
        links = extract_markdown_links(content, relative_path)
        
        # Extract title (first H1 heading)
        title_match = re.search(r'^#\s+(.+)$', content, re.MULTILINE)
        title = title_match.group(1) if title_match else md_file.stem
        
        # Store document info
        document_map[relative_path] = {
            'title': title,
            'path': relative_path,
            'links': [],
            'backlinks': []
        }
        
        # Add to graph nodes
        if relative_path not in link_graph['nodes']:
            link_graph['nodes'].append(relative_path)
        
        # Process links
        for link in links:
            if link['is_internal']:
                # Clean up href to get target path
                target = link['href'].split('#')[0]  # Remove anchors
                if target:  # Skip empty (anchor-only links)
                    document_map[relative_path]['links'].append({
                        'href': target,
                        'anchor_text': link['anchor_text'],
                        'context': link['context']
                    })
                    
                    # Add edge to graph
                    link_graph['edges'].append({
                        'from': relative_path,
                        'to': target,
                        'label': link['anchor_text']
                    })
    
    # Build backlinks
    for source_doc, doc_data in document_map.items():
        for link in doc_data['links']:
            target = link['href']
            # Find the target document (may need path resolution)
            if target in document_map:
                if source_doc not in document_map[target]['backlinks']:
                    document_map[target]['backlinks'].append(source_doc)
    
    return {
        'document_map': document_map,
        'link_graph': link_graph,
        'statistics': {
            'total_documents': len(document_map),
            'total_links': sum(len(doc['links']) for doc in document_map.values()),
            'total_nodes': len(link_graph['nodes']),
            'total_edges': len(link_graph['edges'])
        }
    }

def convert_htm_to_md_in_file(file_path, dry_run=False):
    """
    Convert .htm extensions to .md in a file.
    Returns count of replacements made.
    """
    content = file_path.read_text(encoding='utf-8')
    
    # Replace .htm) with .md) and .htm# with .md#
    new_content = re.sub(r'\.htm(\)|#)', r'.md\1', content)
    
    replacements = len(re.findall(r'\.htm(\)|#)', content))
    
    if not dry_run and replacements > 0:
        file_path.write_text(new_content, encoding='utf-8')
    
    return replacements

def clean_chm_links_in_file(file_path, dry_run=False):
    """
    Remove CHM artifacts from links (e.g., VF.chm::/ prefix).
    Returns count of replacements made.
    """
    content = file_path.read_text(encoding='utf-8')
    
    # Pattern: any .chm::/ prefix in links
    # Matches: VF.chm::/filename.md or anyfile.chm::/path/file.md
    new_content = re.sub(r'\]\([^)]*?\.chm::/([^)]+)\)', r'](\1)', content)
    
    replacements = len(re.findall(r'\.chm::/', content))
    
    if not dry_run and replacements > 0:
        file_path.write_text(new_content, encoding='utf-8')
    
    return replacements

def remove_parent_links_in_file(file_path, dry_run=False):
    """
    Remove parent folder paths from links, keeping just the filename.
    Converts [text](../../../path/file.md) to [text](file.md).
    Returns count of replacements made.
    """
    content = file_path.read_text(encoding='utf-8')
    
    # Pattern: markdown links containing ../ - extract just the filename
    # Matches: [any text](../anything/file.md) -> [any text](file.md)
    new_content = re.sub(r'\]\((?:[\.\/]*\.\./)+(?:[^/)]+/)*([^)]+)\)', r'](\1)', content)
    
    replacements = len(re.findall(r'\]\((?:[\.\/]*\.\./)+', content))
    
    if not dry_run and replacements > 0:
        file_path.write_text(new_content, encoding='utf-8')
    
    return replacements

def validate_links(root_dir, report_broken=True):
    """
    Validate all markdown links in a directory.
    Returns list of broken links with context.
    """
    root = Path(root_dir)
    broken_links = []
    
    for md_file in root.rglob('*.md'):
        content = md_file.read_text(encoding='utf-8')
        links = extract_markdown_links(content, str(md_file))
        
        for link in links:
            if link['is_internal']:
                # Parse the link (handle anchors)
                href = link['href'].split('#')[0]
                
                # Skip empty links and anchors-only
                if not href:
                    continue
                
                # Resolve the path
                if href.startswith('/'):
                    target = root / href.lstrip('/')
                else:
                    target = (md_file.parent / href).resolve()
                
                # Check if target exists
                if not target.exists():
                    broken_links.append({
                        'source': str(md_file.relative_to(root)),
                        'target': href,
                        'anchor_text': link['anchor_text'],
                        'context': link['context']
                    })
    
    return broken_links

def process_directory(root_dir, operation='report', dry_run=False):
    """
    Main processing function.
    Operations: 'report', 'convert', 'validate', 'clean-chm'
    """
    root = Path(root_dir)
    
    if operation == 'convert':
        print(f"Converting .htm to .md in {root_dir}")
        print(f"Dry run: {dry_run}\n")
        
        total = 0
        for md_file in root.rglob('*.md'):
            count = convert_htm_to_md_in_file(md_file, dry_run)
            if count > 0:
                rel_path = md_file.relative_to(root)
                print(f"{rel_path}: {count} replacements")
                total += count
        
        print(f"\nTotal: {total} replacements")
        if dry_run:
            print("(Dry run - no files modified)")
    
    elif operation == 'clean-chm':
        print(f"Cleaning CHM artifacts in {root_dir}")
        print(f"Dry run: {dry_run}\n")
        
        total = 0
        for md_file in root.rglob('*.md'):
            count = clean_chm_links_in_file(md_file, dry_run)
            if count > 0:
                rel_path = md_file.relative_to(root)
                print(f"{rel_path}: {count} replacements")
                total += count
        
        print(f"\nTotal: {total} replacements")
        if dry_run:
            print("(Dry run - no files modified)")
    
    elif operation == 'remove-parent-links':
        print(f"Removing parent folder links in {root_dir}")
        print(f"Dry run: {dry_run}\n")
        
        total = 0
        for md_file in root.rglob('*.md'):
            count = remove_parent_links_in_file(md_file, dry_run)
            if count > 0:
                rel_path = md_file.relative_to(root)
                print(f"{rel_path}: {count} replacements")
                total += count
        
        print(f"\nTotal: {total} replacements")
        if dry_run:
            print("(Dry run - no files modified)")
    
    elif operation == 'validate':
        print(f"Validating links in {root_dir}\n")
        
        broken = validate_links(root_dir)
        if broken:
            print(f"Found {len(broken)} broken links:\n")
            for b in broken:
                print(f"Source: {b['source']}")
                print(f"  Target: {b['target']}")
                print(f"  Text: [{b['anchor_text']}]")
                print(f"  Context: ...{b['context']}...")
                print()
        else:
            print("All links are valid!")
    
    elif operation == 'report':
        print(f"Analyzing links in {root_dir}\n")
        
        all_links = []
        for md_file in root.rglob('*.md'):
            content = md_file.read_text(encoding='utf-8')
            links = extract_markdown_links(content, str(md_file.relative_to(root)))
            all_links.extend(links)
        
        print(f"Total links found: {len(all_links)}")
        print(f"Internal links: {sum(1 for l in all_links if l['is_internal'])}")
        print(f"External links: {sum(1 for l in all_links if not l['is_internal'])}")
        
        # Show links with .htm
        htm_links = [l for l in all_links if '.htm' in l['href']]
        if htm_links:
            print(f"\nLinks with .htm extension: {len(htm_links)}")
            for link in htm_links[:10]:  # Show first 10
                print(f"  {link['source_file']}: {link['href']}")
        
        # Show links with .chm artifacts
        chm_links = [l for l in all_links if '.chm::/' in l['href']]
        if chm_links:
            print(f"\nLinks with .chm artifacts: {len(chm_links)}")
            for link in chm_links[:10]:  # Show first 10
                print(f"  {link['source_file']}: {link['href']}")
        
        # Show parent folder links
        parent_links = [l for l in all_links if '../' in l['href']]
        if parent_links:
            print(f"\nLinks to parent folders (../ paths): {len(parent_links)}")
            for link in parent_links[:10]:  # Show first 10
                print(f"  {link['source_file']}: {link['href']}")
    
    elif operation == 'build-index':
        import json
        
        print(f"Building AI-optimized document index for {root_dir}\n")
        
        index = build_document_index(root_dir)
        
        # Print statistics
        stats = index['statistics']
        print(f"Index Statistics:")
        print(f"  Total documents: {stats['total_documents']}")
        print(f"  Total links: {stats['total_links']}")
        print(f"  Graph nodes: {stats['total_nodes']}")
        print(f"  Graph edges: {stats['total_edges']}")
        
        # Save to JSON file
        output_file = Path(root_dir) / 'document_index.json'
        with open(output_file, 'w', encoding='utf-8') as f:
            json.dump(index, f, indent=2, ensure_ascii=False)
        
        print(f"\nIndex saved to: {output_file}")
        print("\nSample document entry:")
        if index['document_map']:
            sample_doc = next(iter(index['document_map'].values()))
            print(f"  Title: {sample_doc['title']}")
            print(f"  Path: {sample_doc['path']}")
            print(f"  Links: {len(sample_doc['links'])}")
            print(f"  Backlinks: {len(sample_doc['backlinks'])}")

if __name__ == '__main__':
    import sys
    
    if len(sys.argv) < 2:
        print("Usage: python doc_link_extractor.py <operation> [directory] [--dry-run]")
        print("\nOperations:")
        print("  report             - Analyze and report on all links")
        print("  convert            - Convert .htm to .md in all markdown files")
        print("  clean-chm          - Remove .chm::/ artifacts from links")
        print("  remove-parent-links- Remove links to parent folders (../ paths)")
        print("  validate           - Check for broken links")
        print("  build-index        - Build AI-optimized document index (JSON output)")
        print("\nExamples:")
        print("  python doc_link_extractor.py report .")
        print("  python doc_link_extractor.py build-index .")
        print("  python doc_link_extractor.py convert . --dry-run")
        print("  python doc_link_extractor.py clean-chm .")
        print("  python doc_link_extractor.py remove-parent-links .")
        print("  python doc_link_extractor.py validate ../Help-md")
        sys.exit(1)
        print("  clean-chm - Remove .chm::/ artifacts from links")
        print("  validate  - Check for broken links")
        print("\nExamples:")
        print("  python doc_link_extractor.py report .")
        print("  python doc_link_extractor.py convert . --dry-run")
        print("  python doc_link_extractor.py clean-chm .")
        print("  python doc_link_extractor.py validate ../Help-md")
        sys.exit(1)
        print("Usage: python doc_link_extractor.py <operation> [directory] [--dry-run]")
        print("\nOperations:")
        print("  report   - Analyze and report on all links")
        print("  convert  - Convert .htm to .md in all markdown files")
        print("  validate - Check for broken links")
        print("\nExamples:")
        print("  python doc_link_extractor.py report .")
        print("  python doc_link_extractor.py convert . --dry-run")
        print("  python doc_link_extractor.py validate ../Help-md")
        sys.exit(1)
    
    operation = sys.argv[1]
    directory = sys.argv[2] if len(sys.argv) > 2 else '.'
    dry_run = '--dry-run' in sys.argv
    
    process_directory(directory, operation, dry_run)