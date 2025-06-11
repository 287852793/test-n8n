#!/bin/bash
cd `dirname $0`

# start mcp-proxy
# mcp-proxy --port=8096 --named-server-config ./mcp-servers.json &
# mcp-proxy --host=0.0.0.0 --port=8096 --allow-origin="*" uvx mcp-server-fetch &
# mcp-proxy --host=0.0.0.0 --port=8096 --allow-origin="*" --pass-environment --env NEO4J_URI bolt://192.168.10.125:7687 --env NEO4J_USERNAME neo4j --env NEO4J_PASSWORD Neo4j123# --env NEO4J_DATABASE neo4j uvx mcp-neo4j-cypher@0.2.1 
# mcp-proxy --host=0.0.0.0 --port=8096 --allow-origin="*" --pass-environment --env NEO4J_URI bolt://172.20.20.1:7687 --env NEO4J_USERNAME neo4j --env NEO4J_PASSWORD admin123 --env NEO4J_DATABASE neo4j uvx mcp-neo4j-cypher@0.2.1 

# start jupyter lab
jupyter-lab --port=8888 --ip=0.0.0.0 --no-browser --allow-root --NotebookApp.token=''