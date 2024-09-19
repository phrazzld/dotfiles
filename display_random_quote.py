#!/usr/bin/env python3

import os
import json
import random
import textwrap
import shutil
import re

INDEX_FILE = '/Users/phaedrus/development/quotes_index.json'

def display_random_quote():
    if not os.path.isfile(INDEX_FILE):
        print("Quote index not found. Please ensure the indexing script has run successfully.")
        return

    with open(INDEX_FILE, 'r', encoding='utf-8') as f:
        quotes = json.load(f)

    if not quotes:
        print("No quotes found in the index.")
        return

    quote_data = random.choice(quotes)
    quote_text = quote_data['quote']
    source = quote_data['source']

    # Strip the location link from the quote
    # Remove any occurrence of '([Location...](https://...))' at the end of the quote
    quote_text = re.sub(r'\s*\(\[Location.*?\)\s*$', '', quote_text)

    # Check if the quote starts with a lowercase letter
    stripped_quote = quote_text.lstrip('“”"\'').lstrip()
    if stripped_quote and stripped_quote[0].islower():
        quote_text = '... ' + quote_text

    # Remove any trailing comma
    source = source.rstrip(',')

    # Get terminal width for wrapping
    terminal_width = shutil.get_terminal_size((80, 20)).columns
    max_width = min(terminal_width, 100)  # Set a maximum width (e.g., 100 columns)

    # Wrap the quote text
    wrapped_quote = textwrap.fill(quote_text, width=max_width)

    # Format the output
    print('\n' + wrapped_quote)
    print(f"\n— {source}\n")

if __name__ == '__main__':
    display_random_quote()
