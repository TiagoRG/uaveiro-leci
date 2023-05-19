import requests


url = "http://127.0.0.1:8080/form"
data = {"username": "admin", "password": "admin"}
f = requests.post(url, data=data)
print(f.status_code)
