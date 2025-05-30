#!/bin/bash
cd `dirname $0`/docker

docker build -t 172.20.20.187/mcp-proxy:0.0.1 -f mcp-proxy.Dockerfile .
