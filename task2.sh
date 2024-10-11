#!/bin/bash

grep -rl "sample" dataset1 | \
xargs -I {} sh -c 'count=$(grep -o "CSC510" "{}" | wc -l); if [ $count -ge 3 ]; then echo "{} $count $(stat -c "%s" "{}")"; fi' | \
sort -k2,2nr -k3,3nr | \
sed 's/file_/filtered_/g'