from PIL import Image, ExifTags
import sys


def main(file):
    img = Image.open(file)
    fname = '.'.join(file.split(".")[:-1]), file.split(".")[-1]

    width, height = img.size

    for s in [0.2, 8]:
        dimension = (int(width * s), int(height * s))
        new_img = img.resize(dimension, Image.NEAREST)
        new_img.save(fname[0]+"-%.2f.%s" % (s, fname[1]))


if __name__ == '__main__':
    main(sys.argv[1])
