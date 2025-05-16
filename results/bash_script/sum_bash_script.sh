#!/bin/bash

start=$(date +%s.%N)

sum=0
for ((i = 1; i <= 10000000; i++)); do
  sum=$((sum + i))
done

end=$(date +%s.%N)
elapsed=$(echo "$end - $start" | bc)

echo "Sum (Bash): $sum"
echo "Execution Time (Bash): $elapsed seconds"
