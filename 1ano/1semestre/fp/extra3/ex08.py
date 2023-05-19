def load(fname):
    stocks_list = []
    with open(fname, 'r') as f:
        for stock in f:
            components = stock[:-1].split('\t')
            stocks_list.append(
                (components[0], components[1], float(components[2]), float(components[3]), int(components[4])))
    return stocks_list
