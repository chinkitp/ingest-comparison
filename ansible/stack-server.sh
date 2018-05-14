#!/bin/bash


for (( c=1; c<=$1; c++ ))
do  
    sed -i "/masterdroplet:/ a\    - masterdroplet$c" ./digitalocean.yml
done

for (( c=1; c<=$2; c++ ))
do  
    sed -i "/slavedroplet:/ a\    - slavedroplet$c" ./digitalocean.yml
done

ansible-playbook digitalocean.yml --ask-vault-pass

