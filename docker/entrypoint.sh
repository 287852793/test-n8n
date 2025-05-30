#!/bin/bash
cd `dirname $0`

# start mcp-proxy
# mcp-proxy --port=8096 --named-server-config ./mcp-servers.json &
mcp-proxy --host=0.0.0.0 --port=8096 --allow-origin="*" uvx mcp-server-fetch &

# start jupyter lab
jupyter-lab --port=8888 --ip=0.0.0.0 --no-browser --allow-root --NotebookApp.token=''