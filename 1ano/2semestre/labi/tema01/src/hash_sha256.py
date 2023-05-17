import sys
from Crypto.Hash import SHA256


def main(args=None):
    with open(args[0], 'rb') as f:
        buffer = f.read()
        h = SHA256.new()
        h.update(buffer)
        print(h.hexdigest())


if __name__ == '__main__':
    main(sys.argv[1:])
