#!/bin/bash

if [ -z "$1" ]
  then
    echo "Usage: ./cb-mypy-build.sh cb_dir"
    exit 1
fi

cp $1/requirements.txt ../cb_requirements.txt
docker build -t cb-typeshed ..
rm ../cb_requirements.txt
