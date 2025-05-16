#!/bin/bash
echo -e "File\tA\tT\tC\tG" > nucleotide_counts_summary.txt
for file in split_part_*.fasta; do
  counts=$(grep -v '^>' "$file" | tr -d '\n' | tr '[:lower:]' '[:upper:]' | awk '
  {
    a=gsub(/A/, "", $0);
    t=gsub(/T/, "", $0);
    c=gsub(/C/, "", $0);
    g=gsub(/G/, "", $0);
    printf "%d\t%d\t%d\t%d", a, t, c, g;
  }')
  echo -e "$(basename "$file")\t$counts" >> nucleotide_counts_summary.txt
done
cat nucleotide_counts_summary.txt
