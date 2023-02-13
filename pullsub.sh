#!/bin/bash
 
# List the MKV files in the current directory
files=(*.mkv)
 
# Show the files in a numbered list
i=1
for file in "${files[@]}"; do
  echo "$i) $file"
  ((i++))
done
 
# Ask the user to enter the number of the desired file
echo "Enter the number of the file you want to use:"
read file_num
 
# Check if the entered number is valid
if [ $file_num -lt 1 ] || [ $file_num -gt ${#files[@]} ]; then
  echo "Invalid number"
  exit 1
fi
 
# Set the filename
filename=${files[$file_num-1]}
 
# First command: mkvmerge -i $filename
mkvmerge -i $filename
 
# Ask the user for the track number
echo "Enter the track number:"
read track_num
 
# Second command: mkvextract $filename tracks $track_num:$filename.sup
mkvextract $filename tracks $track_num:$filename.sup
