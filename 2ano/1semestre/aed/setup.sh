#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 <source file>"
    exit 1
fi

if [ ! -f "$1" ]; then
    echo "File $1 does not exist"
    exit 1
fi

out_dirname=$(dirname "$1")
out_basename=$(basename "$1")

if [ ! -d "out" ]; then
    mkdir out
fi
if [ ! -d "out/$out_dirname" ]; then
    mkdir -p "out/$out_dirname"
fi

gcc -Wall -Wextra -Werror -g -o "out/$out_dirname/${out_basename%.*}" "$1" -lm

out/"$out_dirname"/"${out_basename%.*}"
