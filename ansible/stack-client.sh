#!/bin/bash

ssh root@104.131.70.203 << EOF
git clone https://github.com/chinkitp/ingest-comparison.git
cd ingest-comparison/src/clients/$2
docker-compose build --no-cache
docker-compose up
EOF