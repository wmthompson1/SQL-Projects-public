# Gitbook - SQL Code to Markdown Converter
# This script reads a .sql file and converts its content into a Markdown (.md) file    
# by wrapping the SQL code in appropriate Markdown code block syntax.
    # It is designed to be used with Gitbook documentation to display SQL code snippets in a formatted way.
# the output folder will be different from the input folder:
# input_folder = Shared%20Documents/SQL%20Scripts
# output_folder = Python%20Utilities/Output1    
# Iterates through all .sql files in the input folder and generates corresponding .md files in the output folder.

import os
import glob
from pathlib import Path

input_folder = "Shared%20Documents/SQL%20Scripts"
output_folder = "Python%20Utilities/Output1"    

def convert_sql_to_markdown(sql_file_path, markdown_file_path):
    """
    Converts a .sql file to a .md file by wrapping its content in a SQL code block.

    Args:
        sql_file_path (str): The path to the input .sql file.
        markdown_file_path (str): The path to the output .md file.
    """
    try:
        with open(sql_file_path, 'r', encoding='utf-8') as sql_file:
            sql_content = sql_file.read()

        # Add title based on filename
        filename = Path(sql_file_path).stem
        markdown_content = f"# {filename}\n\n```sql\n{sql_content}\n```"

        with open(markdown_file_path, 'w', encoding='utf-8') as md_file:
            md_file.write(markdown_content)

        print(f"Successfully converted '{sql_file_path}' to '{markdown_file_path}'")
        return True

    except FileNotFoundError:
        print(f"Error: File not found at '{sql_file_path}'")
        return False
    except Exception as e:
        print(f"An error occurred: {e}")
        return False

def convert_all_sql_files(input_folder, output_folder):
    """
    Converts all .sql files in the input folder to .md files in the output folder.
    
    Args:
        input_folder (str): Path to the folder containing .sql files
        output_folder (str): Path to the folder where .md files will be created
    """
    # Create output folder if it doesn't exist
    Path(output_folder).mkdir(parents=True, exist_ok=True)
    
    # Find all .sql files in the input folder
    sql_files = glob.glob(os.path.join(input_folder, "*.sql"))
    
    if not sql_files:
        print(f"No .sql files found in '{input_folder}'")
        return
    
    print(f"Found {len(sql_files)} .sql files to convert...")
    
    success_count = 0
    for sql_file in sql_files:
        # Generate output filename
        filename = Path(sql_file).stem
        output_file = os.path.join(output_folder, f"{filename}.md")
        
        # Convert the file
        if convert_sql_to_markdown(sql_file, output_file):
            success_count += 1
    
    print(f"\nConversion complete: {success_count}/{len(sql_files)} files converted successfully")

def convert_all_sql_files_recursive(input_folder, output_folder):
    """
    Recursively converts all .sql files in the input folder and subfolders to .md files.
    
    Args:
        input_folder (str): Path to the root folder containing .sql files
        output_folder (str): Path to the folder where .md files will be created
    """
    # Create output folder if it doesn't exist
    Path(output_folder).mkdir(parents=True, exist_ok=True)
    
    # Find all .sql files recursively
    sql_files = []
    for root, dirs, files in os.walk(input_folder):
        for file in files:
            if file.lower().endswith('.sql'):
                sql_files.append(os.path.join(root, file))
    
    if not sql_files:
        print(f"No .sql files found in '{input_folder}' (searched recursively)")
        return
    
    print(f"Found {len(sql_files)} .sql files to convert (searched recursively)...")
    
    success_count = 0
    for sql_file in sql_files:
        # Generate output filename with relative path structure
        rel_path = os.path.relpath(sql_file, input_folder)
        filename = Path(rel_path).stem
        subfolder = Path(rel_path).parent
        
        # Create subfolder in output if needed
        output_subfolder = os.path.join(output_folder, subfolder) if subfolder != '.' else output_folder
        Path(output_subfolder).mkdir(parents=True, exist_ok=True)
        
        output_file = os.path.join(output_subfolder, f"{filename}.md")
        
        # Convert the file
        if convert_sql_to_markdown(sql_file, output_file):
            success_count += 1
    
    print(f"\nConversion complete: {success_count}/{len(sql_files)} files converted successfully")

# Example usage:
if __name__ == "__main__":
    # Option 1: Convert SQL_Reports folder
    print("=== Converting SQL_Reports folder ===")
    convert_all_sql_files_recursive("SQL_Reports", "Python Utilities/Output1/SQL_Reports")
    
    print("\n=== Converting Shared SQL Files folder ===")
    convert_all_sql_files_recursive("Shared SQL Files", "Python Utilities/Output1/Shared_SQL_Files")
    
    # You can also convert a specific subfolder:
    # convert_all_sql_files_recursive("SQL_Reports/Inventory", "Python Utilities/Output1/Inventory")