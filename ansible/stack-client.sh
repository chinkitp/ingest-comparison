#!/bin/bash

ssh root@104.131.70.203 << EOF
docker rm $(docker ps -aq) -f
rm ingest-comparison -R
git clone https://github.com/chinkitp/ingest-comparison.git
cd ingest-comparison/src/clients/$1
docker-compose build --no-cache
docker-compose up
EOF