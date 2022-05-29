#!/bin/sh

./build.sh

docker run --rm --name flerwin-web -d -p1234:80 flerwin-web:latest