#!/bin/bash

# Create a directory called bash_demo
mkdir -p bash_demo

# Navigate into the directory
cd bash_demo

# Create a file called demo.txt and write text to it, including the current date
echo "This file was created by a Bash script on $(date +%Y-%m-%d)" > demo.txt

# Confirm the directory and file were created
echo "Directory 'bash_demo' created. File 'demo.txt' created."
echo ""

# Display the file contents
echo "File contents:"
cat demo.txt
