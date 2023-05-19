# Given a string s and a string t, return a string in which all the characters
# of s that occur in t have been replaced by a _ sign. The comparisons are
# case sensitive.

def replaceCharactersWithUnderscores(s, t):
    # Your code here...
    new_str = ""

    for c in s:
        if c in t:
            new_str += '_'
        else:
            new_str += c

    return new_str
