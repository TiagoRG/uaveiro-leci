# This program generates 20 terms of a sequence by a recurrence relation.
Un = 100  # Un = each term of the sequence. Initially = U0
count = 0
while Un > 0:
    print(round(Un, 4))
    Un = 1.01 * Un - 1.01  # Set Un to the next term of the sequence
    count += 1

print('O programa mostrou ', count, ' termos')
