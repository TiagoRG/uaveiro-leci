import os
import sys
from Crypto.Cipher import AES


def main(args=None):
    cipher = AES.new(os.urandom(16), AES.MODE_ECB)
    print(cipher.encrypt(b'Hello World!'))


if __name__ == '__main__':
    main(sys.argv[1:])
