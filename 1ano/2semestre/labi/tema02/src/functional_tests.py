import os
import subprocess


def test_invalid_arguments():
    result = subprocess.run(["python", "listdir.py", "invalid", "invalid"], stdout=subprocess.PIPE,
                            stderr=subprocess.PIPE)
    assert result.returncode == 1
    assert b"Usage: python listdir.py <directory_path> <ignore_term>" in result.stdout


def test_nonexistent_directory():
    result = subprocess.run(["python", "listdir.py", "nonexistent", "invalid"], stdout=subprocess.PIPE,
                            stderr=subprocess.PIPE)
    assert result.returncode == 1

    assert b"Error: could not list directory." in result.stdout


def test_ignore_term():
    with open("test.txt", "w") as f:
        f.write("file1\nfile2\nignoreme.txt\n")

    result = subprocess.run(["python", "listdir.py", ".", "ignoreme"], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    assert result.returncode == 0
    assert b"ignoreme.txt" not in result.stdout
    assert b"file1\nfile2" in result.stdout

    os.remove("test.txt")
