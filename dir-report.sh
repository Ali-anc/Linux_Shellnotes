#!/bin/bash

# Define the output file with a unique name based on the timestamp
output_file="/tmp/home_dir_report_$(date +'%Y%m%d_%H%M%S').txt"

# Start writing to the output file
echo "Home Directory Size Report" > "$output_file"
echo "Generated on $(date)" >> "$output_file"
echo "-------------------------------------" >> "$output_file"

# Iterate through each user directory in /home
for userdir in /home/*; do
    # Ensure it is a directory
    if [ -d "$userdir" ]; then
        # Get the size of the user's home directory excluding dir-in-question
        homedir_size=$(du -sh "$userdir" --exclude="$userdir/dir-in-question" | cut -f1)

        # Check if dir-in-question exists and get its size if it does
        if [ -d "$userdir/dir-in-question" ]; then
            dir-in-question_size=$(du -sh "$userdir/dir-in-question" | cut -f1)
            echo "User directory: $userdir" >> "$output_file"
            echo "Home directory size (excluding dir-in-question): $homedir_size" >> "$output_file"
            echo "dir-in-question folder exists, size: $dir-in-question_size" >> "$output_file"
        else
            echo "User directory: $userdir" >> "$output_file"
            echo "Home directory size: $homedir_size" >> "$output_file"
            echo "dir-in-question folder does not exist." >> "$output_file"
        fi

        echo "------------------------" >> "$output_file"
    fi
done

# Print the location of the output file
echo "Report generated and saved to $output_file"



###Example Output File:###

: << 'END'
Home Directory Size Report
Generated on YYYY-MM-DD HH:MM:SS
-------------------------------------
User directory: /home/username
Home directory size (excluding dir-in-question): 2.5G
dir-in-question folder exists, size: 500M
------------------------
User directory: /home/otheruser
Home directory size: 1.2G
dir-in-question folder does not exist.
------------------------
END
