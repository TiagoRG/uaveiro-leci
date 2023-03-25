import json


def main(args=None):
    data = [
        {"time": 1394984189, "name": "cpu", "value": 12},
        {"time": 1394984189, "name": "cpu", "value": 19}
    ]

    print(json.dumps(data, indent=4))
    json.dump(data, open('../datafiles/example3.json', 'w'), indent=4)


if __name__ == '__main__':
    main()
