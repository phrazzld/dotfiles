import os
import re
import json

# Set the path to your Obsidian vault
VAULT_PATH = '/Users/phaedrus/rubberducks'

# Set the path for the index file
INDEX_FILE = '/Users/phaedrus/development/quotes_index.json'

# Regular expression to match the #quote tag
TAG_REGEX = re.compile(r'#quote\b')

# Function to scan the vault and index quotes
def index_quotes():
    quotes = []
    # Walk through all files in the vault
    for root, dirs, files in os.walk(VAULT_PATH):
        for file in files:
            if file.endswith('.md'):
                file_path = os.path.join(root, file)
                with open(file_path, 'r', encoding='utf-8') as f:
                    content = f.read()
                    # Check if the file contains the #quote tag
                    if TAG_REGEX.search(content):
                        # Extract the quote and source
                        quote_text, source = extract_quote_and_source(content)
                        if quote_text:
                            quotes.append({
                                'quote': quote_text.strip(),
                                'source': source.strip() if source else 'Unknown',
                                'path': file_path
                            })
    # Write the quotes to the index file
    with open(INDEX_FILE, 'w', encoding='utf-8') as f:
        json.dump(quotes, f, ensure_ascii=False, indent=4)

# Function to extract the quote and source from the content
def extract_quote_and_source(content):
    # Simple parsing logic (you may need to adjust this based on your note format)
    lines = content.strip().split('\n')
    quote_text = ''
    source = ''
    in_quote = False
    for line in lines:
        if line.strip() == '```quote':
            in_quote = True
            continue
        if in_quote:
            if line.strip() == '```':
                in_quote = False
                continue
            quote_text += line + '\n'
        elif line.lower().startswith('source:'):
            source = line.split(':', 1)[1].strip()
    return quote_text.strip(), source.strip()

if __name__ == '__main__':
    index_quotes()
