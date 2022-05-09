# Madrid Recicla Development Template <!-- omit in toc -->

[![Linkedin](https://img.shields.io/badge/LinkedIn-carlosmartinezm-blue)](https://www.linkedin.com/in/carlosmartinezm/)

**Madrid Recicla Development Template** is part of the distributed application **Madrid Recicla**.

- [Madrid Recicla Database]
- [Madrid Recicla Server]
- [Madrid Recicla Web]

**Madrid Recicla Development Template** provides development support to Madrid Recicla suite, allowing developers to quicky setup and run a development environment in Docker.


## Contents <!-- omit in toc -->
- [Configuring the workspace](#configuring-the-workspace)
  - [Worspace structure](#worspace-structure)
  - [Setting up the workspace](#setting-up-the-workspace)
  - [Ignoring cloned repositories](#ignoring-cloned-repositories)
  - [Providing environment variables](#providing-environment-variables)
    - [Specific environment variables for each repo](#specific-environment-variables-for-each-repo)
    - [General environment variables for development template](#general-environment-variables-for-development-template)
- [Starting the application](#starting-the-application)
- [Others](#others)

## Configuring the workspace

### Worspace structure

Madrid Recicla Development Template can be thought as a workspace for developing the application. It is treated as a root folder with inner folders being other Madrid Recicla projects.

A non-exhaustive folder structure is as follows:

```yaml
madrid-recicla # This repository.
├── db # Madrid Recicla Database. Part of this repository.
│   ├── .env # Specific environment variables.
├── server # Madrid Recicla Server repository.
│   ├── .env # Specific environment variables.
│   ├── Dockerfile # Dockerfile.
├── web # Madrid Recicla Web repository.
│   ├── .env # Specific environment variables.
│   ├── Dockerfile # Dockerfile.
├── .env # General environment variables for docker-compose.
├── .gitignore
├── docker-compose.yml
```

> Not all the files and directories are shown in the previous structure. 
> 
> `.env` files are just illustrative and are not and should never be pushed to the repositories.

### Setting up the workspace

1. First clone this repository to your local machine.

```sh
% git clone https://github.com/martinezcarlos/madrid-recicla-dev-template.git madrid-recicla
```
> Note the `madrid-recicla` name at the end of the command.

2. Inside the `madrid-recicla` folder, clone the `server` repository.

```sh
% git clone https://github.com/martinezcarlos/madrid-recicla-server.git server
```
> Note the `server` name at the end of the command.

3. Inside the `madrid-recicla` folder, clone the `web` repository.

```sh
% git clone https://github.com/martinezcarlos/madrid-recicla-web.git web
```
> Note the `web` name at the end of the command.

### Ignoring cloned repositories

`.gitinore` file contains the list of files and directories that should be ignored by git. It is important to note that it has an _internals_ section that ignores the directories cloned in the previous step, as well as `.env` files.

```properties
...

# Internals
.env
# Madrid Recicla Server folder
/server
# Madrid Recicla Web folder
/web

...
```

### Providing environment variables

#### Specific environment variables for each repo

Once all the repositories are cloned, environment variables are required for proper executions. Please read the _environment variables_ section of each repository documentation for more information on how to populate their `.env` files.

#### General environment variables for development template

As mentioned before, each repository (as well as the local DB) has their own `.env` file, to which you can assign direct values for the required environment variables keys. You can, however, use reference keys as shown in each repository documentation, and centralize the values in a single `.env` file in the _General environment variables for docker-compose_.

This general `.env` file contain the following required and optional properties:

<details>
  <summary>Click to expand general .env file</summary>

```properties
# === Required properties for docker-compose === #

# MongoDB Default Setup (Proposed values. Change as you see fit)
DATABASE_PORT=27017
DATABASE_CONTAINER_PORT=27017

# Server Default setup (Proposed values. Change as you see fit)
# localhost is accessible through non-container clients like browsers or Postman.
SERVER_HOST=http://localhost
SERVER_PORT=8080
SERVER_CONTAINER_PORT=8080

# Web default setup (Proposed values. Change as you see fit)
WEB_PORT=8000
WEB_CONTAINER_PORT=80
SERVER_URL=${SERVER_HOST}:${SERVER_PORT}
MAPBOX_TOKEN_PATH=...
CLOTHES_CONTAINERS_PATH=...

# Swagger UI (Proposed values. Change as you see fit)
SWAGGER_PORT_EXT=8081
SWAGGER_CONTAINER_PORT_EXT=8080
SWAGGER_PORT_INT=8082
SWAGGER_CONTAINER_PORT_INT=8080

# === Optional properties for docker-compose === #

# MongoDB Default Setup
DATABASE_HOST=madrec-db # Accessible only inside Docker network. For external clients it'll be localhost.
DATABASE_NAME=...
DATABASE_ROOT_USERNAME=...
DATABASE_ROOT_PASSWORD=...

# Server Default setup (Proposed values. Change as you see fit)
SERVER_DB_USER=...
SERVER_DB_PASSWORD=...
MAPBOX_TOKEN=...
DB_NAME=${DATABASE_NAME}
DB_CONNECTION_URI=mongodb://${SERVER_DB_USER}:${SERVER_DB_PASSWORD}@${DATABASE_HOST}:${DATABASE_PORT}/?authMechanism=SCRAM-SHA-1&authSource=${DB_NAME}

# Web default setup (Proposed values. Change as you see fit)
WEB_URL=http://localhost:${WEB_PORT}

# Swagger UI (Proposed values. Change as you see fit)
SWAGGER_UI_EXT_URL=localhost:${SWAGGER_PORT_EXT}
SWAGGER_UI_INT_URL=localhost:${SWAGGER_PORT_INT}

# Others
LIVE_SERVER_URL=http://127.0.0.1:5500 # For webpack-dev-server.
# Origins to be allowed by the Server. Comma separated.
ALLOWED_ORIGINS=${WEB_URL},${LIVE_SERVER_URL},${SWAGGER_UI_EXT_URL},${SWAGGER_UI_INT_URL}
```

> Optional properties are only useful if you define them in the general `.env` file and use them from the _specific `.env` files_ of each repository.
>
> Note that if you plan on running each service independently (i.e. not using docker compose) and you chose optional keys to be replaced by the general `.env` file, you need to manually add the values to the specific `.env` file of the service you plan to run, as `docker-compose.yml` and the general `.env` file are not considered for non-docker-compose executions.

</details>

## Starting the application

Once you have cloned the repositories and provided the necesary `.env` files, you can build and deploy the application to local Docker containers. To do so, simply run the following commands:

```sh
% docker compose build
```

```sh
% docker compose up
```

You should have Docker containers running and organized in a bundle similar to this structure:

```yaml
madrid-recicla # Enclosing folder
├── db # Madrid Recicla Database container.
├── server # Madrid Recicla Server container.
├── web # Madrid Recicla Web container.
├── api-int # Swagger UI container, describing internal API.
├── api-ext # Swagger UI container, describing external API.
```

## Others

[![Linkedin](https://img.shields.io/badge/LinkedIn-carlosmartinezm-blue)](https://www.linkedin.com/in/carlosmartinezm/)
[![Hex.pm](https://img.shields.io/hexpm/l/plug)](http://www.apache.org/licenses/LICENSE-2.0)
[![Open Source](https://badges.frapsoft.com/os/v1/open-source.svg?v=103)](https://opensource.org/)

<!-- Links -->
[Madrid Recicla Database]: </db/README.md>
[Madrid Recicla Server]: <https://github.com/martinezcarlos/madrid-recicla-server>
[Madrid Recicla Web]: <https://github.com/martinezcarlos/madrid-recicla-web>
[Madrid Recicla Development Template]: <https://github.com/martinezcarlos/madrid-recicla-dev-template>