#!/bin/bash

# JSON file containing the IP information
json_file="terraform-output.json"
echo "reading from $json_file"


# Extract master nodes IPs and format them
touch instances.ini
echo "[master-nodes]" > instances.ini
echo "Write master nodes IPs to instances.ini"
jq -r '.["master-nodes-public-ip"].value[][][]' "$json_file" >>instances.ini

# Extract worker nodes IPs and format them
echo "Write worker nodes IPs to instances.ini"
echo "[worker-nodes]" >> instances.ini
jq -r '.["worker-nodes-public-ip"].value[][][]' "$json_file" >>instances.ini
echo "instances.ini created successfully."
