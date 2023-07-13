# Databases
Common databases for all service. This `docker-stack.yaml` deploys below databases
* Redis
* Postgresql

## Deploy databases
```bash
$ cd raspberrypi-homeserver/services/databases
$ docker stack deploy -c docker-stack.yml databases
```

### Secrets
Databases secrets are typically shared between multiple services. The above stack creates secrets which can be used in servcies

```bash
$ docker secret ls
ID                          NAME                                 DRIVER    CREATED              UPDATED
iwf1jjhfc1wd2hzftp8f41247   databases_postgres_password                    6 minutes ago        6 minutes ago
a6cm47sv3lzkj7936gqrblv1f   databases_postgres_user                        6 minutes ago        6 minutes ago
nf17rcx3nqdv34cpa6m89bws5   databases_redis_host_password                  6 minutes ago        6 minutes ago
```

You can use these secrets in services by defining as `external`
```yaml
version: '3'

secrets:
  db_user:
    external: true
  db_password:
    external: true

services:
  postgres_db:
  image: postgres
  secrets:
    - db_user
    - db_password
...
```

### Network
[`networks.yml`](../traefik/networks.yml) stack creates `network_databases` network which has `attachable: true`, i.e. services can attach to this network to communicate to databases. Databases are reachable with their service names
```bash
$ docker service ls
ID             NAME                      MODE         REPLICAS   IMAGE                                                 PORTS
jrsr17tq7byq   databases_postgres        replicated   1/1        arm64v8/postgres:14-alpine
865t9t0f6wv9   databases_redis           replicated   1/1        redis:7.0.5-alpine

$ docker network ls
NETWORK ID     NAME                  DRIVER    SCOPE
j2476k65uux5   network_databases    overlay   swarm

# For example, let's create a service with network "network_databases" to test connection to postgresq
$ docker service create \
  --replicas 1 \
  --network network_databases
  --name helloworld1 alpine ping databases_postgres
vzsktr6sn7ychq0p04o21hg10
overall progress: 1 out of 1 tasks
1/1: running   [==================================================>]
verify: Service converged

# verify newly created service is reachable to postgres container via "network_databases"
$ docker service logs vzsktr6sn7ychq0p04o21hg10
helloworld1.1.cku71u9yhzkj@atom    | PING databases_postgres (172.16.202.5): 56 data bytes
helloworld1.1.cku71u9yhzkj@atom    | 64 bytes from 172.16.202.5: seq=0 ttl=64 time=0.535 ms
helloworld1.1.cku71u9yhzkj@atom    | 64 bytes from 172.16.202.5: seq=1 ttl=64 time=0.367 ms
...
```

## Postgresql Tips
Default user `trinity` and `nextcloud` database create during startup.

* Database creation
  ```bash
  # find the postgres container
  $ docker ps | grep postgres

  # login with default user and template0 database
  $ docker exec -it --user postgres [CONTAINER_ID] psql -U trinity -d template1
  ```

  Run below sql command to create database(If required, create user too)
  ```sql
  CREATE DATABASE mydb;
  CREATE USER suma WITH ENCRYPTED PASSWORD 'mypass';
  GRANT ALL PRIVILEGES ON DATABASE mydb TO suma;
  ```

## Redis Tips
Default password is `Snort9`

```bash
$ docker exec -it 6a012506399b redis-cli -h 127.0.0.1 -p 6379 -a 'Snort9'
Warning: Using a password with '-a' or '-u' option on the command line interface may not be safe.
127.0.0.1:6379> ACL USERS
1) "default"
127.0.0.1:6379>
```
