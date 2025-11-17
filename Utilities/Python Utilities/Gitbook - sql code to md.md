## Explanation:

convert_sql_to_markdown(sql_file_path, markdown_file_path) function:

Takes the input SQL file path and the desired output Markdown file path as arguments.  

Opens the SQL file in read mode ('r') and reads its entire content into the sql_content variable.  

Constructs the markdown_content string by enclosing the sql_content within a Markdown code block using triple backticks (```````) and specifying sql as the language for syntax highlighting.
Opens the Markdown file in write mode ('w') and writes the markdown_content to it.
Includes error handling for FileNotFoundError and other potential exceptions.
Example Usage (if __name__ == "__main__":)
Defines input_sql_file and output_markdown_file variables.
Creates a sample my_database_script.sql file for demonstration purposes. You should replace this with your actual SQL file.
Calls the convert_sql_to_markdown function to perform the conversion.