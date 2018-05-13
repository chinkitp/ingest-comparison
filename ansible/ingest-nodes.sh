#!/bin/bash
echo $1

if [[ $1 == 1 ]]; then
    ansible-playbook digitalocean.yml --ask-vault-pass
fi


