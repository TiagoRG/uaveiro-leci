import hashlib
import sys


def main(args=None):
    with open(args[0], 'rb') as f:
        buffer = f.read(512)
        h = hashlib.sha1()
        while len(buffer) > 0:
            h.update(buffer)
            buffer = f.read(512)
        print(h.hexdigest())


if __name__ == '__main__':
    main(sys.argv[1:])
