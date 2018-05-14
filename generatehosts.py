import requests, json
r=requests.get("https://api.digitalocean.com/v2/droplets", headers={"Authorization":"Bearer b752ff24abd52999fba93e0ddc8c8a5f7e39eec58967c3dad82a6b800a2074ae"})

hosts = r.json()

print len(hosts['droplets'])

for()

