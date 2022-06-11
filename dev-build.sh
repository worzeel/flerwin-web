#!/bin/sh

./build.sh

files=(main.min.js index.html)
mkdir -p ./out && for f in "${files[@]}"; do cp $f $_; done