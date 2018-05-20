#!/usr/bin/env bash
set -e
echo "Running DDL scripts..."
psql -h localhost -U postgres -f ../SqlScripts/ddl.sql
echo "Loading csv files into postgresql..."
time jq -r '"\"(.id)\"|\(.)"' /postgresfiles/all-nodes.json  | psql -U postgres -h localhost  -d graph -c "COPY allnodes (id,data) FROM stdin delimiter '|' "
time jq -r '"\"(.id)\"|\(.)"' /postgresfiles/all-edges.json  | psql -U postgres -h localhost  -d graph -c "COPY alledges (id,data) FROM stdin delimiter '|' "

psql -U postgres -h localhost  -d graph -c  "CREATE INDEX sourceidx ON alledges USING BTREE ((data -> 'source'))"
psql -U postgres -h localhost  -d graph -c  "CREATE INDEX targetidx ON alledges USING BTREE ((data -> 'target'))"
psql -U postgres -h localhost  -d graph -c  "SELECT * FROM alledges WHERE data->'source' ? 'eOmVOGSyMJC01AKsIXQxyg';"