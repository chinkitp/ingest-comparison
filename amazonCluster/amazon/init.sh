#!/bin/bash

export AWS_ACCESS_KEY_ID=""
export AWS_SECRET_ACCESS_KEY=""




python setup.py $1 $2

python test.py


# instances=`expr $1 + $2` 
# echo $instances

# sed -i -e "s/<instances>/$instances/g" aws.yml


# ansible-playbook aws.yml