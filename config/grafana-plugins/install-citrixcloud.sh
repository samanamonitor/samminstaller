#!/bin/bash

wget https://s3.us-west-2.amazonaws.com/monitor.samanagroup.co/samm-citrixodata-datasource.tgz
tar -xzvf samm-citrixodata-datasource.tgz
rm samm-citrixodata-datasource.tgz

echo "### To enable citrix cloud plugin for grafana, modify the docker-compose.yml file"
echo "### and remove the comment \`#\` sign on the lines that specify the volume that"
echo "### maps the plugin inside the grafana container and the environment variable"
echo "### that allows for unsigned plugins to run."
echo "### Example of this can be found in the docker-compose.yml file."
