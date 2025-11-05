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

        markdown_content = f"```sql\n{sql_content}\n```"

        with open(markdown_file_path, 'w', encoding='utf-8') as md_file:
            md_file.write(markdown_content)

        print(f"Successfully converted '{sql_file_path}' to '{markdown_file_path}'")

    except FileNotFoundError:
        print(f"Error: File not found at '{sql_file_path}'")
    except Exception as e:
        print(f"An error occurred: {e}")

# Example usage:
if __name__ == "__main__":
    input_sql_file = "my_database_script.sql"  # Replace with your SQL file name
    output_markdown_file = "my_database_script.md" # Replace with your desired Markdown file name

    # Create a dummy SQL file for demonstration
    with open(input_sql_file, 'w', encoding='utf-8') as f:
        f.write("-- This is a sample SQL script\n")
        f.write("CREATE TABLE users (\n")
        f.write("    id INT PRIMARY KEY,\n")
        f.write("    name VARCHAR(255),\n")
        f.write("    email VARCHAR(255) UNIQUE\n")
        f.write(");\n")
        f.write("INSERT INTO users (id, name, email) VALUES (1, 'Alice', 'alice@example.com');\n")

    convert_sql_to_markdown(input_sql_file, output_markdown_file)