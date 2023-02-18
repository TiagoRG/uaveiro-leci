# Screw 1.4 :skull:
import codecs
import os
import sys
from Crypto.Cipher import ARC4


def main(args=None):
    with open(args[0], 'r') as f:
        text = f.read(2048)
    cipher = ARC4.new(bit_array_from_str(args[1]))
    cryptogram = cipher.encrypt(text)
    os.write(1, cryptogram)
    print()


def bit_array_from_str(s):
    return [codecs.encode("hex") for elem in s]


if __name__ == '__main__':
    main(sys.argv[1:])
