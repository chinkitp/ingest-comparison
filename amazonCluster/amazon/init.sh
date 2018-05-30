#!/bin/bash

export AWS_ACCESS_KEY_ID="$3"
export AWS_SECRET_ACCESS_KEY="$4"




python setup.py $1 $2

python test.py $2
python merge.py
rm *.tmp
rm $2


# instances=`expr $1 + $2` 
# echo $instances

# sed -i -e "s/<instances>/$instances/g" aws.yml


# ansible-playbook aws.yml