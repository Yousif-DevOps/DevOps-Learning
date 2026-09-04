#!/bin/bash

# Prompt the user for a filename
echo -n "Enter filename to check: "
read filename

# Check if the file exists
if [ -e "$filename" ]; then
    echo "File '$filename' exists."

    # Check if the file is readable
    if [ -r "$filename" ]; then
        echo "✓ File is readable"
    else
        echo "✗ File is not readable"
    fi

    # Check if the file is writable
    if [ -w "$filename" ]; then
        echo "✓ File is writable"
    else
        echo "✗ File is not writable"
    fi

    # Check if the file is executable
    if [ -x "$filename" ]; then
        echo "✓ File is executable"
    else
        echo "✗ File is not executable"
    fi
else
    echo "File '$filename' does not exist."
fi
