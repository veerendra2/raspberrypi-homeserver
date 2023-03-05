# Nextcloud
> https://nextcloud.com/

| | |
| ---------------------------------------------------------------------------- | -------------------------- |
| Enable [userns-remap](https://docs.docker.com/engine/security/userns-remap/) | Yes           |
| Default Credentials                                                              | - Username: [`admin`](https://github.com/veerendra2/raspberrypi-homeserver/blob/main/apps/nextcloud/secrets/nextcloud_admin_user.txt) <br/>- Password: [`changeme`](https://github.com/veerendra2/raspberrypi-homeserver/blob/main/apps/nextcloud/secrets/nextcloud_admin_password.txt)  |
| Reverse Proxy Location | `/nextcloud` |
***

* Docker compose project [apps/nextcloud](https://github.com/veerendra2/raspberrypi-homeserver/tree/main/apps/nextcloud)
* Ansible tasks [tasks/nextcloud.yml](https://github.com/veerendra2/raspberrypi-homeserver/blob/main/tasks/nextcloud.yml)

## Stack Info
Below are the docker containers deployed with `docker-compose.yml`
* Nextcloud
* Postgresql
* Redis

## Configuration
| Config | Description |
| ------ | ----------- |
| [apps/nextcloud/.env_nextcloud](https://github.com/veerendra2/raspberrypi-homeserver/blob/main/apps/nextcloud/.env_nextcloud) | Nextcloud configuration |
| [apps/nextcloud/.env_postgres](https://github.com/veerendra2/raspberrypi-homeserver/blob/main/apps/nextcloud/.env_postgres) | Postgresql configuration |
| [apps/nextcloud/docker-compose.yml#L38](https://github.com/veerendra2/raspberrypi-homeserver/blob/main/apps/nextcloud/docker-compose.yml#L38) | Directory mount configuration |
| [apps/nginx/locations/nextcloud.conf](https://github.com/veerendra2/raspberrypi-homeserver/blob/main/apps/nginx/locations/nextcloud.conf) | Nginx reverse proxy config |

## Backup
These are basic steps to perform backup nextcloud with `restic`

From nextcloud [docs](https://docs.nextcloud.com/server/latest/admin_manual/maintenance/backup.html), there 2 location that need to be backed up. There are 
* Nextcloud data directory
* Postgresql database dumps
For these, we need to create 2 restic repos to maintain.
### 1. Initialize restic repos
```
NEXTCLOUD_DATA_RESTIC_REPO="/media/disk1/nextcloud_data_restic_repo"
NEXTCLOUD_PG_RESTIC_REPO="/media/disk1/nextcloud_pg_restic_repo"
BACKUP_DIR="/media/disk2/nextcloud"
RESTIC_PASSWORD_FILE="/home/veerendra/pass.txt"
``` 
* `NEXTCLOUD_DATA_RESTIC_REPO` is the restic repo for nextcloud data directory backup
* `NEXTCLOUD_PG_RESTIC_REPO` is the restic repo for postgresql database dumps backup
* `BACKUP_DIR` backup directory of nextcloud data
* `RESTIC_PASSWORD_FILE` Restic repo password file for both repos

Init the repos
```
$ restic -r $NEXTCLOUD_DATA_RESTIC_REPO init
$ restic -r $NEXTCLOUD_PG_RESTIC_REPO init
```
### 2. Set maintenance mode ON
```
$ docker exec -it -u www-data nextcloud php occ maintenance:mode --on
```
### 3. Run restic backups
Backup nextcloud data
```
$ restic -r $NEXTCLOUD_DATA_RESTIC_REPO \
      -p $RESTIC_PASSWORD_FILE \
      --json \
      backup $BACKUP_DIR
```
Backup postgresql database dump
```
$ docker exec postgres \
      bash -c 'pg_dump -c -U `cat $POSTGRES_USER_FILE` `cat $POSTGRES_DB_FILE`' | \
      restic backup --stdin --json \
      -r $NEXTCLOUD_PG_RESTIC_REPO \
      -p /home/veerendra/pass.txt \
      --stdin-filename db_postgres_nextcloud.sql
```
### 4. Unset maintenance mode
```
$ docker exec -it -u www-data nextcloud php occ maintenance:mode --off
```

This [shell script](https://gist.github.com/veerendra2/462264542e3de75b4ffbed7bba8a41b3) automates above steps with metrics
## Restore
TODO

## References
* https://github.com/veerendra2/raspberrypi-homeserver/issues/7
* https://github.com/veerendra2/raspberrypi-homeserver/issues/25
