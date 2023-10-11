#!/usr/bin/env sh
if [[ ! -z `cat .env.dev 2> /dev/null` ]]; then
source .env.dev set
fi

if [[ -z "${SERVE_DIR}" ]]; then
echo "SERVE_DIR not set"
exit 1
fi

if [[ -z "${CONF_DIR}" ]]; then
echo "SERVE_DIR not set"
exit 1
fi

docker run -d -p 80:80/tcp -v "${SERVE_DIR}:/srv/portfolio" -v "${CONF_DIR}:/srv/apache" millim-dev
