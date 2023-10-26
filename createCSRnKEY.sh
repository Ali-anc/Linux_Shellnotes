#!/bin/bash

# The following uses fixed values for your bussiness or organization, and outputs the .csr based on that. These values can be changed within the script.
# I've included a timestamp that, when combined with the inputted domain, ensures that keys and CSRs are created in separate folders to prevent overwriting.

# Check if domain name is provided as an argument
if [ $# -ne 1 ]; then
  echo "Usage: $0 <domain_name>"
  exit 1
fi

domain_name=$1
timestamp=$(date +"%Y%m%d%H%M%S") # Get the current timestamp

# Check if domain name ends with a TLD or eTLD
if ! [[ $domain_name =~ ^[a-zA-Z0-9]+(\.[a-zA-Z]{2,}){1}$ ]]; then
  echo "Invalid domain name. Please provide a domain name with a valid TLD or eTLD and exactly one dot (e.g. example.com, example.io, example.org)."
  exit 1
fi

# Create a folder with the domain name and timestamp
folder_name="${domain_name}_${timestamp}"
mkdir -p "/home/somepath/cert/$folder_name"

# Set fixed values
country=US
state=Michigan
locality=Detroit 
org_name="Anc data"
org_unit_name="Internet Services"
email="ancdata@example.com"
common_name="$domain_name"

# Create CSR and KEY
openssl req -new -newkey rsa:2048 -nodes -keyout "/home/somepath/cert/$folder_name/$domain_name.key" -out "/home/somepath/cert/$folder_name/$domain_name.csr" -subj "/C=$country/ST=$state/L=$locality/O=$org_name/OU=$org_unit_name/CN=$common_name/emailAddress=$email"

echo "Certificate Signing Request (.csr) and Private Key (.key) files created for /home/somepath/cert/$folder_name/$domain_name"


: '
# Display CSR and private key
echo "Certificate Signing Request:"
cat $domain_name.csr
echo "Private Key:"
cat $domain_name.key
'
