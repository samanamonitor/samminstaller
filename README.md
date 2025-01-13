# SAMM implemented as a Docker Compose
This implementation requires only to copy this folder structure into 
`/usr/local/samm`
From there, all variables need to be set inside
`/usr/local/samm/config/env`
To configure samm-collector edit the files at
`/usr/local/samm/config/samm`

# Docker recommended configuration
It is important to have a separate partition for Docker with enough storage to hold all the necessary data for history.
If implemented with s3 storage backend, it may not be necessary to have a big partition for it.
`{
	"data-root": "/opt/docker"
	"log-driver": "json-file",
	"log-opts": {
		"max-size": "10m",
		"max-file": "3"
	}
}`