PF = 20
PC = 24.95
IMP = 0.23
SPA = 0.20

profit_per_book = ((PC - SPA) / (1 + IMP)) - PF
imp_per_book = IMP * PC

books_n = int(input('Number of sold books: '))
print(f"Lucro total: {profit_per_book * books_n:.2f}")
print(f"Total de impostos: {imp_per_book * books_n:.2f}")
