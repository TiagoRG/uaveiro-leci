import json


def main(args=None):
    data = json.load(open('../datafiles/example3.json', 'r'))
    print(json.dumps(data, indent=4))


if __name__ == '__main__':
    main()
