#!/bin/bash

INSTALL_DIR=/usr/local/samm
SAMM_OWNER=$(whoami)

SUDO=$(which sudo)
if [ "$?" != "0" ]; then
	echo "Mandatory 'sudo' command is missing" >&2
	exit 1
fi

OPENSSL=$(which openssl)
if [ "$?" != "0" ]; then
	echo "Mandatory 'openssl' command is missing" >&2
	exit 1
fi

DOCKER=$(which docker)
if [ "$?" != "0" ]; then
	echo "Mandatory 'docker' command is missing" >&2
	exit 1
fi


DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

set -e
sudo mkdir -p ${INSTALL_DIR}
sudo chown ${SAMM_OWNER}.docker ${INSTALL_DIR}

cp -R ${DIR}/* ${INSTALL_DIR}
cd ${INSTALL_DIR}


${OPENSSL} req -x509 -newkey rsa:4096 \
	-keyout config/nginx/samm.customer.local.key \
	-out config/nginx/samm.customer.local.crt -sha256 \
	-days 3650 -nodes \
	-subj "/C=XX/ST=Florida/L=Miami/O=Samana Group/OU=ITMS/CN=samm.customer.local"

cat <<EOF | echo
Environment is ready for configuration.
The next step is to go into ./env directory and edit all .env files to set passwords and other configuration
config/env/minio.env
After the configuration, the environment can be started with:
docker compose up [-d]
EOF
