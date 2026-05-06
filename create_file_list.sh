#!/bin/bash

# Number of restart directories
#n=20  # Change this manually

# Output file
output="file.list"
> "$output"  # Clear file before writing

count=0
files=($(ls -1 ../cylinder0.f0* 2>/dev/null))
count=$((count + ${#files[@]}))
printf "%s\n" "${files[@]}" >> "$output"


# Collect file names
#for ((i=1; i<=2; i++)); do
#for i in $(seq 1 $n); do
#    files=($(ls -1 ../restart$i/cylinder0.f0* 2>/dev/null))
#    count=$((count + ${#files[@]}))
#    printf "%s\n" "${files[@]}" >> "$output"
#done

# Insert total count at the top
sed -i "1s/^/$count\n/" "$output"

