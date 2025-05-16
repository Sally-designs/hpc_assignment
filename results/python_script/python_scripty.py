# sum_python.py
import time

start = time.time()
total = sum(range(1, 10000001))
print(f"Sum is: {total}")
print(f"Execution time: {time.time() - start:.4f} seconds")

