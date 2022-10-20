import re

def main():
    print(countDigits("far4214faewf13")) # Tem de dar 6

def countDigits(string):
    nums = r"[0-9]$"
    count = 0
    for char in string:
        if re.match(nums, char):
            count += 1
    return count
            
if __name__ == "__main__":
    main()