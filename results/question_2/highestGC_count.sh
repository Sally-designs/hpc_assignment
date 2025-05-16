#!/bin/bash
# gc_content.sh

echo -e "File\tGC_Content(%)" > gc_content.txt
max_gc=0
max_file=""

for file in split_part_*.fasta; do
  sequence=$(grep -v '^>' "$file" | tr -d '\n' | tr '[:lower:]' '[:upper:]')
  total=$(echo "$sequence" | wc -c)
  gc=$(echo "$sequence" | grep -o '[GC]' | wc -l)
  gc_content=$(awk -v gc="$gc" -v total="$total" 'BEGIN {printf "%.2f", (gc/total)*100}')
  echo -e "$(basename "$file")\t$gc_content" >> gc_content.txt

  if (( $(echo "$gc_content > $max_gc" | bc -l) )); then
    max_gc=$gc_content
    max_file=$(basename "$file")
  fi
done

echo -e "\nFile with Highest GC Content: $max_file ($max_gc%)"

