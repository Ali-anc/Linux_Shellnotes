#!/bin/bash

#====================================================
#  Script Name: jumpbox-to-local.sh
#  Created by: Ali ANC
#  Version: 1
#  Description: 
#    In a corporate environment where direct data transfers from 
#    servers to your local machine using tools like WinSCP, FileZilla, 
#    rsync, or scp are prohibited, an alternative process could be used. 
#    Data must first be copied to a designated jumpbox from multiple servers. 
#    Each time data needs to be transferred, you must specify the host and 
#    the target location, ensuring the syntax is correct.
#    
#    This script simplifies copying data from the jumpbox. Instead of 
#    manually specifying hosts and file paths each time, you simply run 
#    the shell script with the filename as an argument, and it handles the rest.
#====================================================

# List of server hostnames
server_hostnames=("hostname1" "hostname2" "hostname3" "hostname4" "hostname5")

# Check if the argument is provided
if [ $# -eq 0 ]; then
  echo "Usage: $0 <file_or_folder_name>"
  exit 1
fi

# Get the currently logged-in username
current_username=$(whoami)

# File or folder name specified as argument
file_or_folder_name="$1"

# Create a timestamp for appending to the fetched file or folder
timestamp=$(date +"%Y%m%d%H%M%S")

# Loop through each server hostname
for host in "${server_hostnames[@]}"; do

  # Generate a unique name by appending the hostname and timestamp. The purpose of this is to add host in the name via variable.
  unique_name="${file_or_folder_name}_${host}_${timestamp}"
  
  # SCP using the hostname and append a timestamp to the file or folder name
  echo "Fetching from $host..."
  scp -r "${current_username}@${host}:/home/${current_username}/${file_or_folder_name}" "./${unique_name}" 2>/dev/null
done

echo "Fetch complete."
