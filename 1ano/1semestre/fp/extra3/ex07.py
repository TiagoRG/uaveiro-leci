def companyVolume(stocks, city):
    return [(stock[0], stock[4]) for stock in stocks if stock[1] == city]
