import requests, json
import fileinput
import sys


fname = 'elastic-digitalocean.yml'


r=requests.get("https://api.digitalocean.com/v2/droplets", headers={"Authorization":"Bearer " + sys.argv[1]})

hosts = r.json()

length = len(hosts['droplets'])
masters = []
slaves = []
all_hosts=[]

for i in hosts['droplets']:
    # print i['name']
    # print i['networks']
    if 'droplet' in i['name']: 
        if 'master' in i['name']: 
            masters.append(i['networks']['v4'][0]['ip_address'])
            all_hosts.append(i['networks']['v4'][1]['ip_address'])
        elif 'slave' in i['name']: 
            slaves.append(i['networks']['v4'][0]['ip_address'])
            all_hosts.append(i['networks']['v4'][1]['ip_address'])



with open('digitaloceanhosts', 'a') as the_file:
    the_file.write('[master]\n')
for ip in masters:
    with open('digitaloceanhosts', 'a') as the_file:
        the_file.write(ip + '\n')


with open('digitaloceanhosts', 'a') as the_file:
    the_file.write('[slave]\n')
for ip in slaves:
    with open('digitaloceanhosts', 'a') as the_file:
        the_file.write(ip + '\n')


def replaceAll(file,searchExp,replaceExp):
    for line in fileinput.input(file, inplace=1):
        if searchExp in line:
            line = line.replace(searchExp,replaceExp)
        sys.stdout.write(line)


replaceAll(fname,"host_ip_address",(",".join(all_hosts)))




