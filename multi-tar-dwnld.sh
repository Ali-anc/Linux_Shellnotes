#!/bin/bash

# List of URLs for the tar.gz files
urls=(
    "http://example.com/projects/brp/dsa/32d/data1.02.12.tar.gz"
    "http://example.com/data/brp/des/file2.03.15.tar.gz"
    # Add more URLs as needed
)

# Loop through each URL in the array
for url in "${urls[@]}"; do
    # Extract the filename from the URL without the .tar.gz extension
    filename=$(basename "$url" .tar.gz)
    
    # Download the tar.gz file
    wget "$url" -O "${filename}.tar.gz"
    
    # Extract the contents of the tar.gz file
    tar -xzf "${filename}.tar.gz"
    
    # Remove the tar.gz file after extraction
    rm -f "${filename}.tar.gz"
done
