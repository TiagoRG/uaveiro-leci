import subprocess
import sys

if len(sys.argv) < 3:
    print("Usage: python Ex3.py <directory_path> <ignore_term>")
    sys.exit(1)

directory_path = sys.argv[1]
ignore_term = sys.argv[2]

try:
    output = subprocess.check_output(["ls", "-la", directory_path], universal_newlines=True)
    lines = output.split("\n")
    filtered_lines = [line for line in lines if ignore_term not in line]
    print("\n".join(filtered_lines))
except subprocess.CalledProcessError:
    print("Error: could not list directory.")
    sys.exit(1)
