#!/bin/bash
echo -e "File\tLine Count" > line_counts.txt

for file in split_part_*.fasta;
 do
  echo -e "$file\t$(wc -l < "$file")" >> line_counts.txt
done
cat line_counts.txt
