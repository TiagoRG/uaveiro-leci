import os
import sys
from Crypto.Cipher import AES
from Crypto.Hash import SHA256


def main(args=None):
    if len(args) < 2:
        print("Usage: python aes_cipher.py <file> <key>")
        return

    fname = args[0]
    if not os.path.exists(fname) or os.path.isdir(fname) or not os.path.isfile(fname):
        print("File does not exist or is not a file")
        return

    key_arg: str = args[1]
    if len(key_arg) < 16:
        h = SHA256.new()
        h.update(key_arg.encode('utf-8'))
        key = h.digest()[0:16]
        cipher = AES.new(key, AES.MODE_ECB)
    else:
        key = key_arg[0:16]
        cipher = AES.new(bytes(key.encode('utf-u')), AES.MODE_ECB)

    with open(fname, 'rb') as file:
        run = True
        while run:
            block = file.read(AES.block_size)

            if len(block) != AES.block_size:
                p = AES.block_size - len(block)
                block = block + bytes([p]) * p
                run = False

            cryptogram = cipher.encrypt(block)
            os.write(1, cryptogram)


if __name__ == '__main__':
    main(sys.argv[1:])
