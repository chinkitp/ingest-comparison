-es_nodes 1 -client stellar-search

provision 1 node 
ansible-playbook elastic-digitalocean.yml --ask-vault-pass

ansible-playbook client-digitalocean.yml 
    connect to the existing docker client in do via ssh 
    do a git clone of this repo 
    execute the docker-compose of the given client 

    