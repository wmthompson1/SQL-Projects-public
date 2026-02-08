## unresolvex heredoc

## Summary
The EOF token must be at the beginning of the line, you can't indent it along with the block of code it goes with.

If you write <<-EOF you may indent it, but it must be indented with Tab characters, not spaces. So it still might not end up even with the block of code.

Also make sure you have no whitespace after the EOF token on the line.

**detail**
An "unresolved heredoc" or "unexpected end of file" error when using  in a GitHub Actions YAML file is almost always caused by improper indentation of the closing  marker or hidden whitespace. [1, 2]  
Here are the most likely causes and solutions: 
1. The  Marker Must Be at the Start of the Line [2]  
The closing  must not be indented to match the level of the  step. It must be at the very beginning of the line. [1]  
Incorrect: 
Correct: 
2. No Whitespace After  [2]  
Ensure there are no trailing spaces or tabs after the  token on the closing line. [2]  
3. Indented Heredoc (Using ) [3]  
If you want to indent the  for cleaner YAML readability, you must use  (with a hyphen) and ensure the marker is indented with tabs, not spaces. [1, 4]  
Summary Checklist 

• Check that  is not indented. 
• Ensure there are no spaces after  on the last line. 
• Check for consistent indentation throughout the  block. [1]  

If you are seeing an  or similar, that is a Python environment issue, not a YAML heredoc syntax issue. [5]  

AI responses may include mistakes.

[1] https://stackoverflow.com/questions/18660798/here-document-gives-unexpected-end-of-file-error
[2] https://stackoverflow.com/questions/27201004/line-54-warning-here-document-at-line-42-delimited-by-end-of-file-wanted-eof
[3] https://www.docker.com/blog/introduction-to-heredocs-in-dockerfiles/
[4] https://stackoverflow.com/questions/19986541/error-when-using-a-bash-here-doc-unexpected-end-of-file
[5] https://github.com/microsoft/vscode-python/issues/13183

