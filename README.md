# Docker Environment: 3rd-Party Dependencies

Tooling to configure a Velocify environment third-party dependencies in Docker

## Overview

3rd Party dependencies covered in this repository:

- [MongoDB](#MongoDB)
- [MSSQL](#MSSQL)
- [Redis](#REDIS)
- [RabbitMQ](#RABBITMQ)

## Installation

**Dependencies:**

- Docker
- Docker Compose
- Powershell/Bash

**Instructions:**

- Execute the init-volumes script
- Modify the .env contents for any docker compose overrides
- Execute `docker-compose up` from repo install directory
  - default up will start all services configured
  - to start single services, list them after up `docker-compose up mongodb`

**Defaults:**

- container restart set to no: [docker restart policy](https://docs.docker.com/config/containers/start-containers-automatically/#use-a-restart-policy)
- all ports are set to the system defaults
- docker network "local-dev"

### MongoDB

Currently, MongoDB has an issue with directory volumes when running on a Windows host ([fsync on directories](https://docs.mongodb.com/manual/administration/production-notes/#fsync-on-directories)). To get around this limitation, we will use a Docker data volume container. Documentation for Docker volumes can be found [here](https://docs.docker.com/storage/volumes/).

The init-volumes script will create the proper data volume. 

*OPTIONAL/ADVANCED: The optional parameter is the **absolute path** to the data directory on the host machine (--mongoExternalDataPath). If you would like to port an existing mongo instance, before you execute the script, copy the mongo data directory to the data volume source directory.*

EXAMPLE:

Powershell

```powershell
.\init-volumes.ps1 -mongoExternalDataPath F:\dev\GHE\Velocify\docker-environment-thirdparty\volumes\mongodb
```

Bash

```bash
./init-volumes.sh --mongoExternalDataPath f/dev/GHE/Velocify/docker-environment-thirdparty/volumes/mongodb
```

*ensure bash script has the correct end of line sequence*

Suggested GUI: https://robomongo.org/download

### MSSQL

Suggested GUI: https://docs.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms?view=sql-server-2017

### REDIS

### RABBITMQ

The default user is guest/guest. If you would like to change this, uncomment the user/password environment variables.

Suggested GUI: http://localhost:15672/#/ (this is the default port exposed from the script)
