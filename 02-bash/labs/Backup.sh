#!/bin/bash

# Prompt the user for the source directory
echo -n "Enter source directory: "
read source_dir

# Create a backup directory name with a timestamp
timestamp=$(date +%Y-%m-%d_%H-%M)
backup_dir="backup_$timestamp"

# Create the backup directory if it doesn't exist
mkdir -p "$backup_dir"

echo "Backup directory created: $backup_dir"
echo "Copying .txt files..."

# Copy all .txt files from the source directory to the backup directory
cp "$source_dir"/*.txt "$backup_dir"/

# Count how many files were backed up
file_count=$(ls "$backup_dir" | wc -l)

echo "Backup complete! Files backed up: $file_count"
