#!/bin/sh
mariadb -u ${GF_DATABASE_USER} \
    --password=${GF_DATABASE_PASSWORD} \
    -e "SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = '${GF_DATABASE_NAME}';" ${GF_DATABASE_NAME} 