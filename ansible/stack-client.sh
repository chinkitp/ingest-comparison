#!/bin/bash

ssh root@104.131.70.203 << EOF
docker rm $(docker ps -aq) -f
rm ingest-comparison -R
git clone https://github.com/chinkitp/ingest-comparison.git
cd ingest-comparison/src/clients/$1
docker-compose build --no-cache
docker-compose up
EOF

# BASE_PATH="file:/sx-stackoverflow/step2" && \
# curl -XPOST \
#   -H "Content-Type: application/json" \
#   -d '{
#   "graphs": "'"${BASE_PATH}/head.json"'",
#   "edges": "'"${BASE_PATH}/edges.json/all-edges.json"'",
#   "vertices": "'"${BASE_PATH}/nodes.json/all-nodes.json"'"
# }' http://localhost:8080/api/v1.0/indexes/stackoverflowstep2