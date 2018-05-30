#!/usr/bin/env bash
set -e
echo "Running DDL scripts..."
psql -h localhost -U postgres -f ../SqlScripts/ddl.sql
echo "Loading csv files into postgresql..."
time jq -r '"\"\(.id)\"|\(.)"' /postgresfiles/all-nodes.json  | psql -U postgres -h localhost  -d graph -c "COPY allnodes (id,data) FROM stdin delimiter '|' "
time jq -r '"\"\(.id)\"|\"\(.source)\"|\"\(.target)\"|\(.)"' /postgresfiles/all-edges.json  | psql -U postgres -h localhost  -d graph -c "COPY alledges (id,source,target,data) FROM stdin delimiter '|' "

psql -U postgres -h localhost  -d graph -c  "CREATE INDEX ix_source ON alledges (source)"
psql -U postgres -h localhost  -d graph -c  "CREATE INDEX ix_target ON alledges (target)"


# psql -U postgres -h localhost  -d graph -c "SELECT * FROM alledges WHERE data ->> 'source' = 'k1HyHC4vSNCq2wuTQvjV1g';"



# awk '{print "SELECT * FROM alledges WHERE data ->> '"'"'source'"'"' = '"'"'" $0 "'"'"';"}' '/docker-entrypoint-initdb.d/NodesIds' > 'output'
# while read -r line
# do
#      final="$line$final"
# done < output

# time psql -U postgres -h localhost  -d graph << EOF
# $final
# EOF