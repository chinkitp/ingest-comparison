#!/bin/bash

NODES="$1"

if [ NODES = 1 ]; then
    ansible-playbook digitalocean.yml --ask-vault-pass
fi


