# Docker recommended configuration
It is important to have a separate partition for Docker with enough storage to hold all the necessary data for history.
If implemented with s3 storage backend, it may not be necessary to have a big partition for it.

```
{
	"data-root": "/opt/docker",
	"log-driver": "json-file",
	"log-opts": {
		"max-size": "10m",
		"max-file": "3"
	}
}
```

# SAMM implemented as a Docker Compose
Implementation instructions:
1. run `./install.sh`
2. change directory to `/usr/local/samm`
3. Set all the environment variables in the env files `/usr/local/samm/config/env`
4. Clone the dashboard git repository into `/usr/local/samm/config/grafana/provisioning/dashboards`
```
cd /usr/local/samm/config/grafana/provisioning/dashboards
git clone https://github.com/samanamonitor/samm-dashboards
```
5. To configure samm-server, edit the files at `/usr/local/samm/config/samm`
6. run `docker compose up -d`

# SAMM Configuration settings
* run `sammmanager/install.sh <SAMMFQDN> <ORGNAME>`
* set the organization name in grafana to <ORGNAME>

# Kerberos authentication
For kerberos authentication it is recommended to generate a keytab file instead of using username and password.
To generate the keytab file, execute the following command:
```
ktpass /out samm.keytab /princ <USERNAME>@<REALM> /mapuser <USERNAME> /pass +rndPass /ptype KRB5_NT_PRINCIPAL /crypto AES256-SHA1
```
The file generated `samm.keytab` needs to be copied into `/usr/local/samm/config/samm` folder
Then, edit the config/env/samm.env file and enable the KRB5_CLIENT_KTNAME environment variable
