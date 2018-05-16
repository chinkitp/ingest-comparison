#!/bin/bash


for (( c=1; c<=$1; c++ ))
do  
    sed -i "/masterdroplet:/ a\    - masterdroplet$c" ./digitalocean.yml
done

for (( c=1; c<=$2; c++ ))
do  
    sed -i "/slavedroplet:/ a\    - slavedroplet$c" ./digitalocean.yml
done

sed -i -e "s/digital_ocean_token/$3/g" ./digitalocean.yml
ansible-playbook digitalocean.yml

python generate_hosts.py $3


ansible-playbook elastic-digitalocean.yml -i digitaloceanhosts
