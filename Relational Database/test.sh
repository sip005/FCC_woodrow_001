#!/bin/bash

# Output file name
output_file="output.md"

# Remove the file if it already exists
rm -f $output_file

# Loop to generate 200 blocks
for i in $(seq -w 0 199); do
  echo "## ${i}" >> $output_file
  echo "" >> $output_file
  echo "\`\`\`sh" >> $output_file
  echo "" >> $output_file
  echo "\`\`\`" >> $output_file
  echo "" >> $output_file
done

echo "Generated 200 blocks in $output_file"
