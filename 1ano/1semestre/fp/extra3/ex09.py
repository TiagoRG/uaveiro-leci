def trinsPerMerchandise(trains):
    content_dict = {}
    for train, content in trains.items():
        for item in content:
            if item[0] not in content_dict:
                content_dict[item[0]] = set()
            content_dict[item[0]].add(train)
    return content_dict
