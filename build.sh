#!/usr/bin/env sh

if [ $1 = '-h' ]; then
echo "Usage:"
echo "\t$ sh build.sh [-h] [<tag>] "
echo "\tBuilds the docker container with the given <tag>."
echo "Parameters:"
echo "\t<tag>\tTag to use for the docker image. Defaults to ISO date."
echo "Options:"
echo "\t-h\t displays this screen"
exit
fi

tag=$1

if [ -z $1 ]; then
tag=`date +%Y-%m-%d`
fi

docker build -t millim-dev:$tag .
