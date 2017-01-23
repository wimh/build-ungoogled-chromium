#!/bin/bash

git clone https://github.com/Eloston/ungoogled-chromium.git
cd ungoogled-chromium

if [ "$1" == "bash" ]; then
  exec bash
elif [ -n "$1" ]; then
  git checkout $1
fi

python3 ./build.py

if [ -d /output ]; then
  mv build/*.tar.xz /output
fi

exec bash
