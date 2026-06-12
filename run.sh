#!/bin/bash

cmd=$1

if [ "$cmd" = "build_generator" ]; then
  docker build -t hw3_gen ./generator

elif [ "$cmd" = "run_generator" ]; then
  docker run --rm -v "$(pwd)/data:/data" hw3_gen

elif [ "$cmd" = "build_reporter" ]; then
  docker build -t hw3_rep ./reporter

elif [ "$cmd" = "run_reporter" ]; then
  docker run --rm -v "$(pwd)/data:/data" hw3_rep

else
  echo "Unknown command"
fi