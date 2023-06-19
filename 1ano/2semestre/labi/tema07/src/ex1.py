from PIL import Image, ExifTags
import sys


def main(fname):
    img = Image.open(fname)

    width, height = img.size

    print("Width: %dpx" % width)
    print("Height: %dpx" % height)
    print("Format: %s" % img.format)

    tags = img._getexif()

    for tag, value in tags.items():
        decoded = ExifTags.TAGS.get(tag, tag)
        print("%s: %s" % (decoded, value))


if __name__ == '__main__':
    main(sys.argv[1])
