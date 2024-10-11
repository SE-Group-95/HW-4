#!/bin/bash

grep -rl "sample" dataset1 | \
xargs -I {} sh -c 'echo -n "{} "; grep -o "CSC510" "{}" | wc -l' | \
grep -E ' [3-9][0-9]*$' | \
sort -k2,2nr -k1,1 | \
uniq | \
awk '{print $1}' | \
sed 's/file_/filtered_/g'