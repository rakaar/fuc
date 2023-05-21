
import os

base_url = "https://github.com/rakaar/fuc/blob/master/"

def process_file(filepath):
    with open(filepath, 'r', errors='ignore') as file:
        lines = file.readlines()
        if len(lines) >= 1:
            first_line = lines[0].replace("%", "").replace("USAGE", "").strip()
        else:
            first_line = "No content in the file"
            
        if len(lines) >= 2:
            second_line = lines[1].replace("%", "").strip()
        else:
            second_line = "No second line in the file"
        
        return first_line, second_line

# Start README
readme_text = ""

# Walk the directory structure
for dirpath, dirnames, filenames in os.walk("."):
    # Ignore hidden directories
    dirnames[:] = [d for d in dirnames if not d[0] == '.']
    if dirpath != ".":
        readme_text += "\n## " + dirpath + "\n"
        i = 1
        for filename in filenames:
            filepath = os.path.join(dirpath, filename)
            first_line, second_line = process_file(filepath)
            url = base_url + filepath
            readme_text += "{}. [{}]({}). USAGE: `{}`\n".format(i, first_line, url, second_line)
            i += 1

# Write README
with open("README.md", 'w') as readme_file:
    readme_file.write(readme_text)
