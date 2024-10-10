#!/bin/bash

# Navigate to dataset1 directory
cd dataset1 || { echo "dataset1 directory not found."; exit 1; }

# Build a single pipeline of commands for tasks a, b, and c
grep -l "sample" file* | \
xargs -I {} grep -oH "CSC510" {} | \
sed 's/:CSC510//' | \
sort | uniq -c | \

# Filter files with at least 3 occurrences of "CSC510" using grep and uniq
grep -E '^[ ]*([3-9]|[1-9][0-9]+) ' | \

# gawk to get file sizes and prepare for sorting
gawk '{
    count = $1
    file = $2
    "stat -c%s \"" file "\"" | getline size
    print file, count, size
}' | \

# Sort by count descending, then by size descending
sort -k2,2nr -k3,3nr | \

# Substitute "file_" with "filtered_"
sed 's/file_/filtered_/' | \

# Extract only the filename
awk '{print $1}'

# Navigate back to the parent directory
cd ..