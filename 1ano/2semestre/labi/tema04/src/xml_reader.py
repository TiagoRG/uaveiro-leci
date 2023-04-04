from lxml import etree


def main(args=None):
    xml = etree.parse('../datafiles/conf.xml')
    root = xml.getroot()
    print(root.tag)
    print_childs(root)


def print_childs(root):
    for child in root:
        print(child.tag, child.attrib, child.text)
        print_childs(child)


if __name__ == '__main__':
    main()
