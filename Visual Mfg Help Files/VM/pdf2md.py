    import pymupdf4llm
    import pathlib

    # Specify the path to your input PDF file
    pdf_file_path = "input.pdf" 

    # Convert the PDF to Markdown
    md_text = pymupdf4llm.to_markdown(pdf_file_path)

    # Optionally, save the Markdown output to a file
    output_md_file = "output.md"
    pathlib.Path(output_md_file).write_bytes(md_text.encode("utf-8"))

    print(f"PDF converted to Markdown and saved to {output_md_file}")