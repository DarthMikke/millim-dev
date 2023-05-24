#!/usr/bin/env sh
if [ -z `cat ./portfolio-path 2> /dev/null` ]
echo "portfolio-path er tom."
exit 1
fi

docker run -d -p 80:80/tcp -v `cat ./portfolio-path`:/srv/portfolio millim-dev
