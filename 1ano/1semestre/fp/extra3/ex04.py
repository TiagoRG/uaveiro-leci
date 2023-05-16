# Given a string s, return the longest prefix that is repeated somewhere else in the string.
# For example, "abcdabejf" would return "ab" as "ab" starts at the beginning of the string
# and is repeated again later. Do not use the find method.

def longestPrefixRepeated(s):
    # Your code here...
    longest = ""

    for i in range(1, len(s) // 2 + 1):
        if s[:i] in s[i:]:
            longest = s[:i]

    return longest
