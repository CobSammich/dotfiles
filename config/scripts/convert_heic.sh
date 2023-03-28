#!/bin/bash

# Used for converting images taken with iPhone to pngs for including in my
# notes

# Loop over all .heic files in the current directory
for file in *.heic; do
  # Get the file name without the extension
  name=$(basename "$file" .heic)
  # Convert the .heic file to .png with the same name
  command_to_run="heif-convert $file $name.png"
  echo $command_to_run
  $command_to_run
done
