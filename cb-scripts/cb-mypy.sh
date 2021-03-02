#!/bin/bash

if [ -z "$1" ]
  then
    echo "Usage: ./cb-mypy.sh cb_dir"
    exit 1
fi

docker run -it --rm \
  -v $1:/cb-dev \
  cb-typeshed
