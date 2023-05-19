import requests


f = requests.get("https://www.ua.pt")
print(f.text)
