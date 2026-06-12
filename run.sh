#!/bin/bash

cmd=$1

if [ "$cmd" = "build_generator" ]; then
  docker build -t gen ./generator

elif [ "$cmd" = "run_generator" ]; then
  docker run --rm -v "$(pwd)/data:/data" gen

elif [ "$cmd" = "create_local_data" ]; then
  python3 generator/generate.py local_data

elif [ "$cmd" = "build_reporter" ]; then
  docker build -t rep ./reporter

elif [ "$cmd" = "run_reporter" ]; then
  docker run --rm -v "$(pwd)/data:/data" rep

elif [ "$cmd" = "structure" ]; then
  find .

elif [ "$cmd" = "clear_data" ]; then
  rm -f data/*.csv
  rm -f data/*.html

elif [ "$cmd" = "inside_generator" ]; then
  docker run --rm -v "$(pwd)/data:/data" --entrypoint sh gen -c "ls /data"

elif [ "$cmd" = "inside_reporter" ]; then
  docker run --rm -v "$(pwd)/data:/data" --entrypoint sh rep -c "ls /data"

else
  echo "Unknown command"
fi