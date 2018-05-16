#!/bin/bash

set -e

aws s3 cp s3://stackoverflow-dataset/subgraphs/step2 ~/sx-stackoverflow/step2 --recursive

cd ~/sx-stackoverflow/step2/nodes.json/label=answer
sed -e 's/"graphs":\["Lr41MAakQRqPwVuj3j4jCg"\]/"meta":{"label":"answer","graphs":\["Lr41MAakQRqPwVuj3j4jCg"\]}/g' --in-place *.json
sed -e 's/"props"/"data"/g' --in-place *.json

cd ~/sx-stackoverflow/step2/nodes.json/label=question
sed -e 's/"graphs":\["Lr41MAakQRqPwVuj3j4jCg"\]/"meta":{"label":"question","graphs":\["Lr41MAakQRqPwVuj3j4jCg"\]}/g' --in-place *.json
sed -e 's/"props"/"data"/g' --in-place *.json

cd ~/sx-stackoverflow/step2/nodes.json/label=comment
sed -e 's/"graphs":\["Lr41MAakQRqPwVuj3j4jCg"\]/"meta":{"label":"comment","graphs":\["Lr41MAakQRqPwVuj3j4jCg"\]}/g' --in-place *.json
sed -e 's/"props"/"data"/g' --in-place *.json
 
cd ~/sx-stackoverflow/step2/nodes.json/label=user
sed -e 's/"graphs":\["Lr41MAakQRqPwVuj3j4jCg"\]/"meta":{"label":"user","graphs":\["Lr41MAakQRqPwVuj3j4jCg"\]}/g' --in-place *.json
sed -e 's/"props"/"data"/g' --in-place *.json

cd ~/sx-stackoverflow/step2/edges.json/label=asked
sed -e 's/"graphs":\["Lr41MAakQRqPwVuj3j4jCg"\]/"meta":{"label":"asked","graphs":\["Lr41MAakQRqPwVuj3j4jCg"\]}/g' --in-place *.json
sed -e 's/"props"/"data"/g' --in-place *.json
sed -e 's/"src"/"source"/g' --in-place *.json
sed -e 's/"dst"/"target"/g' --in-place *.json

cd ~/sx-stackoverflow/step2/edges.json/label=gave
sed -e 's/"graphs":\["Lr41MAakQRqPwVuj3j4jCg"\]/"meta":{"label":"gave","graphs":\["Lr41MAakQRqPwVuj3j4jCg"\]}/g' --in-place *.json
sed -e 's/"props"/"data"/g' --in-place *.json
sed -e 's/"src"/"source"/g' --in-place *.json
sed -e 's/"dst"/"target"/g' --in-place *.json

cd ~/sx-stackoverflow/step2/edges.json/label=made
sed -e 's/"graphs":\["Lr41MAakQRqPwVuj3j4jCg"\]/"meta":{"label":"made","graphs":\["Lr41MAakQRqPwVuj3j4jCg"\]}/g' --in-place *.json
sed -e 's/"props"/"data"/g' --in-place *.json
sed -e 's/"src"/"source"/g' --in-place *.json
sed -e 's/"dst"/"target"/g' --in-place *.json

cd ~/sx-stackoverflow/step2/edges.json/label=on
sed -e 's/"graphs":\["Lr41MAakQRqPwVuj3j4jCg"\]/"meta":{"label":"on","graphs":\["Lr41MAakQRqPwVuj3j4jCg"\]}/g' --in-place *.json
sed -e 's/"props"/"data"/g' --in-place *.json
sed -e 's/"src"/"source"/g' --in-place *.json
sed -e 's/"dst"/"target"/g' --in-place *.json

cd ~/sx-stackoverflow/step2/edges.json/label=to
sed -e 's/"graphs":\["Lr41MAakQRqPwVuj3j4jCg"\]/"meta":{"label":"to","graphs":\["Lr41MAakQRqPwVuj3j4jCg"\]}/g' --in-place *.json
sed -e 's/"props"/"data"/g' --in-place *.json
sed -e 's/"src"/"source"/g' --in-place *.json
sed -e 's/"dst"/"target"/g' --in-place *.json

cat ~/sx-stackoverflow/step2/nodes.json/*/*.json > ~/sx-stackoverflow/step2/nodes.json/all-nodes.json
cat ~/sx-stackoverflow/step2/edges.json/*/*.json > ~/sx-stackoverflow/step2/edges.json/all-edges.json
echo '{"data":{},"id":"Lr41MAakQRqPwVuj3j4jCg","meta":{"label":"sx-stackoverflow"}}' > ~/sx-stackoverflow/step2/head.json