import json
import requests


address = "Universidade de Aveiro, 3810-193 Aveiro, Portugal"

servurl = "https://nominatim.openstreetmap.org/search.php?format=json&q=%s" % address

r = requests.get(servurl)

print(json.dumps(r.json(), indent=4, sort_keys=True))
print("Latitude:", r.json()[0]["lat"], "\nLongitude:", r.json()[0]["lon"])
