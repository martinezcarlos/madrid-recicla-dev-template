# Madrid Recicla Database <!-- omit in toc -->

[![Linkedin](https://img.shields.io/badge/LinkedIn-carlosmartinezm-blue)](https://www.linkedin.com/in/carlosmartinezm/)

**Madrid Recicla Database** is part of the distributed application **Madrid Recicla**.

- [Madrid Recicla Database]
- [Madrid Recicla Server]
- [Madrid Recicla Web]

**Madrid Recicla Database** provides local development storage, used as part of _Docker compose_ local deployment. In production, it is replaced by a remote database.

## Contents <!-- omit in toc -->
- [Environment variables](#environment-variables)
- [Accessing the database](#accessing-the-database)
- [Others](#others)


## Environment variables

Madrid Recicla Database uses a set of environment variables that need to be setup before running the application. To do so, create a file called `.env` in the `db` directory as follows:

```sh
madrid-recicla
├── db # Madrid Recicla Database.
│   ├── entrypoint
│   ├── .env # Specific environment variables.
│   ├── README.md

```

Provide the `.env` file with proper values for the following keys:

```sh
MONGO_INITDB_ROOT_USERNAME=${DATABASE_ROOT_USERNAME}
MONGO_INITDB_ROOT_PASSWORD=${DATABASE_ROOT_PASSWORD}
MONGO_INITDB_DATABASE=${DATABASE_NAME}
SERVER_DB_USER=${SERVER_DB_USER} # Madrid Recicla Server username
SERVER_DB_PASSWORD=${SERVER_DB_PASSWORD} # Madrid Recicla Server password
```

## Accessing the database

You can use any MongoDB client to access the database. For a local connection, the format is:

```sh
mongodb://<username>:<password>@localhost:<port>/?authMechanism=SCRAM-SHA-1&authSource=<database>
```

## Others

[![Linkedin](https://img.shields.io/badge/LinkedIn-carlosmartinezm-blue)](https://www.linkedin.com/in/carlosmartinezm/)
[![Hex.pm](https://img.shields.io/hexpm/l/plug)](http://www.apache.org/licenses/LICENSE-2.0)
[![Open Source](https://badges.frapsoft.com/os/v1/open-source.svg?v=103)](https://opensource.org/)

<!-- Links -->
[Madrid Recicla Database]: <https://github.com/martinezcarlos/madrid-recicla-dev-template/db/README.md>
[Madrid Recicla Server]: <https://github.com/martinezcarlos/madrid-recicla-server>
[Madrid Recicla Web]: <https://github.com/martinezcarlos/madrid-recicla-web>
[Madrid Recicla Development Template]: <https://github.com/martinezcarlos/madrid-recicla-dev-template>