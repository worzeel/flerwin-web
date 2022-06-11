#!/bin/sh

./dev-build.sh

docker run --rm --name flerwin-web -d -v `pwd`/out:/usr/share/nginx/html -p1234:80 nginx:latest