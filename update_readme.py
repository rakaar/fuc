
import os
import re

base_url = "https://github.com/rakaar/fuc/blob/master/"

def process_file(filepath):
    with open(filepath, 'r', errors='ignore') as file:
        lines = file.readlines()
        if len(lines) >= 1:
            first_line = lines[0].replace("%", "").replace("Usage", "").strip()
        else:
            first_line = "No content in the file"
            
        if len(lines) >= 2:
            second_line = lines[1].replace("%", "").strip()
        else:
            second_line = "No second line in the file"
        
        return first_line, second_line

def process_directory_name(dir_name):
    # Remove special characters
    cleaned_name = re.sub('[^A-Za-z0-9_ ]+', '', dir_name)
    # Replace underscores with spaces
    cleaned_name = cleaned_name.replace("_", " ")
    # Capitalize the first letter
    cleaned_name = cleaned_name.capitalize()
    return cleaned_name

# Start README
readme_text = "# FUC (Frequently Used Codes)\n"

# Walk the directory structure
for dirpath, dirnames, filenames in os.walk("."):
    # Ignore hidden directories
    dirnames[:] = [d for d in dirnames if not d[0] == '.']
    if dirpath != ".":
        dir_name = os.path.basename(dirpath)
        dir_name = process_directory_name(dir_name)
        readme_text += "\n## " + dir_name + "\n"
        i = 1
        for filename in filenames:
            filepath = os.path.join(dirpath, filename)
            first_line, second_line = process_file(filepath)
            url = base_url + filepath
            readme_text += "{}. [{}]({}). Usage: `{}`\n".format(i, first_line, url, second_line)
            i += 1

# Write README
with open("README.md", 'w') as readme_file:
    readme_file.write(readme_text)
