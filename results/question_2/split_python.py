import random
from pathlib import Path

input_file = "HIV_ref_genome.fasta"
with open(input_file) as f:
    lines = f.readlines()

total_lines = len(lines)
splits = [0] * 50
remaining = total_lines

# Generate 50 random split sizes summing up to total_lines
for i in range(49):
    splits[i] = random.randint(1, remaining - (49 - i))
    remaining -= splits[i]
splits[49] = remaining

start = 0
for idx, count in enumerate(splits):
    part_lines = lines[start:start + count]
    with open(f"split_part_{idx+1}.fasta", "w") as f:
        f.writelines(part_lines)
    start += count

