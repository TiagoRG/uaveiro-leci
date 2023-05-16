def printStocks(stocks):
    for stock in stocks:
        print(
            f"{stock[0]:<10}{stock[1]:<19}{stock[2]:>6.2f}{stock[3]:>10.2f}{stock[4]:>10}{(stock[3] / stock[2] - 1) * 100:>7.1f}%")
