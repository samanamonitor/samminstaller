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

# SAMM implemented as a Docker Compose
Implementation instructions:
1. Create base directory
- `mkdir -p /usr/local/samm`
2. Copy all the files into `/usr/local/samm`
- `cp -R * /usr/local/samm`
3. Set all the environment variables in the env files
- `/usr/local/samm/config/env`
4. To configure samm-server, edit the files at `/usr/local/samm/config/samm`
