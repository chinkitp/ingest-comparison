import requests, json
r=requests.get("https://api.digitalocean.com/v2/droplets", headers={"Authorization":"Bearer b752ff24abd52999fba93e0ddc8c8a5f7e39eec58967c3dad82a6b800a2074ae"})

hosts = r.json()

length = len(hosts['droplets'])
masters = []
slaves = []

for i in hosts['droplets']:
    # print i['name']
    # print i['networks']
    if 'droplet' in i['name']: 
        if 'master' in i['name']: 
            masters.append(i['networks']['v4'][0]['ip_address'])
        elif 'slave' in i['name']: 
            slaves.append(i['networks']['v4'][0]['ip_address'])


print masters
print slaves


with open('hosts', 'a') as the_file:
    the_file.write('[master]\n')
for ip in masters:
    with open('hosts', 'a') as the_file:
        the_file.write(ip + '\n')


with open('hosts', 'a') as the_file:
    the_file.write('[slaves]\n')
for ip in slaves:
    with open('hosts', 'a') as the_file:
        the_file.write(ip + '\n')