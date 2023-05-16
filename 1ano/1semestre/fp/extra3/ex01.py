# On a chessboard, positions are marked with letters between a and h for the column and a
# number between 1 and 8 for the row. The first place on the board, a1, is black. The next
# is white, alternating across a row. Odd rows start with black, even rows start with white.

# Give a 2 character input string with a letter (a-h) and a number (1-8), print "Black" or
# "White" indicating if the square is black or white.

inputStr = 'b3'

print("Black" if (
        (inputStr[0] in ['a', 'c', 'e', 'g'] and int(inputStr[1]) % 2 == 1)
        or (inputStr[0] in ['b', 'd', 'f', 'h'] and int(inputStr[1]) % 2 == 0)
)
      else "White")
