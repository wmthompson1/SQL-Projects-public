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