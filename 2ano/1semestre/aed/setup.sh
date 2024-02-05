#!/bin/bash

parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" || exit ; pwd -P )
cd "$parent_path" || exit

if [ $# -lt 1 ] || [ $# -gt 2 ]; then
    echo "Usage: $0 <source file> [debug|memcheck]"
    exit 1
fi

if [ ! -f "$1" ]; then
    echo "File $1 does not exist"
    exit 1
fi

if [ "${1: -2}" != ".c" ]; then
    echo "File $1 is not a C source file"
    exit 1
fi

if [ ! -x "$(command -v gcc)" ]; then
    echo "gcc is not installed"
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

if [ $? -ne 0 ]; then
    echo "Compilation failed"
    exit 1
fi

if [ ! -f "out/$out_dirname/${out_basename%.*}" ]; then
    echo "Compilation failed"
    exit 1
fi

if [ $# -eq 2 ]; then
    if [ "$2" == "debug" ]; then
        if [ ! -x "$(command -v gdb)" ]; then
            echo "gdb is not installed"
            exit 1
        fi
        gdb "out/$out_dirname/${out_basename%.*}" "out/$out_dirname/${out_basename%.*}.core" -tui
        exit 0
    elif [ "$2" == "memcheck" ]; then
        if [ ! -x "$(command -v valgrind)" ]; then
            echo "valgrind is not installed"
            exit 1
        fi
        valgrind --leak-check=full --show-leak-kinds=all --track-origins=yes "out/$out_dirname/${out_basename%.*}"
        exit 0
    else
        echo "Usage: $0 <source file> [debug|memcheck]"
        exit 1
    fi
fi

out/"$out_dirname"/"${out_basename%.*}"
