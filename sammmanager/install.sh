#!/bin/bash

usage() {
	echo "$0 <SAMMFQDN> <ORGNAME>"
	echo $1
	exit 1
}

SAMMFQDN=$1
ORGNAME=$2
if [ -z "${SAMMFQDN}" ]; then
	usage "Must define a FQDN for SAMM"
fi
if [ -z "${ORGNAME}" ]; then
	usage "Must define an Organization Name"
fi
sed -e "s/samm.customer.local/${SAMMFQDN}/" config.json.example > config.json
aws s3api put-object --bucket samm.samana.cloud --body config.json --key ${ORGNAME}/config.json