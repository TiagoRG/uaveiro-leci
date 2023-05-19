# A teenager is a person between 13 and 19 years old, inclusive.
# A child is under 13.  A grown-up is 20 or more.
# This program outputs the age category for a given input age.
# It has a semantic error.  Can you find it?
# Which values of age produce the output "grown-up"?
# Correct the error.
# Can you simplify the code to avoid redundant conditions?

age = int(input("Age? "))

if age < 0:
    print("ERROR: invalid age!")
    exit(1)  # this terminates the program

print("Age:", age)

if age < 13:
    cat = "child"
elif age < 20:
    cat = "teenager"
else:
    cat = "grown-up"

print("Category: ", cat)
