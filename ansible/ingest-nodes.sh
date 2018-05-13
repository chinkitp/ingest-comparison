#!/bin/bash


if [[ $1 == 1 ]]; then
    ansible-playbook digitalocean.yml --ask-vault-pass
fi

# for (( c=1; c<=$1; c++ ))
# do  
#     sed -i '/masterdroplet:/ a\     - droplet$c\n' ./digitalocean.yml
# done


ssh root@104.131.70.203 << EOF
git clone https://github.com/chinkitp/ingest-comparison.git
cd ingest-comparison/src/clients/$2
docker-compose up
EOF