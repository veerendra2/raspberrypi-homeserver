#!/bin/bash
# Author: Veerendra K
# Description: Run restic backup and writes metrics to file for node exporter's textfile collector
# Dependencies: restic, jq
#
# ** INFO ***
# https://www.robustperception.io/using-the-textfile-collector-from-a-shell-script/
# https://github.com/prometheus/node_exporter
# Set --collector.textfile.directory in node_exporter


NEXTCLOUD_DATA_RESTIC_REPO="/media/disk1/nextcloud_data_restic_test"
NEXTCLOUD_PG_RESTIC_REPO="/media/disk1/nextcloud_pg_restic_test"
BACKUP_DIR="/media/disk2/nextcloud"
RESTIC_PASSWORD_FILE="/home/veerendra/pass.txt"
TEXTFILE_COLLECTOR_DIR="/opt/apps/monitoring/textfile_collector"

START="$(date +%s)"
trap "docker exec -it -u www-data nextcloud php occ maintenance:mode --off" EXIT

echo "[*] Settings maintenance mode on"
docker exec -it -u www-data nextcloud php occ maintenance:mode --on
echo "[*] Backup nextcloud data to the restic repo -> $NEXTCLOUD_DATA_RESTIC_REPO"
restic -r $NEXTCLOUD_DATA_RESTIC_REPO \
      -p $RESTIC_PASSWORD_FILE \
      --json \
      backup $BACKUP_DIR | tail -1 > /tmp/nextcloud_data_restic_stats.json

echo "[*] Backup nextcloud pg to the restic repo -> $NEXTCLOUD_PG_RESTIC_REPO"
docker exec postgres \
      bash -c 'pg_dump -c -U `cat $POSTGRES_USER_FILE` `cat $POSTGRES_DB_FILE`' | \
      restic backup --stdin --json \
      -r $NEXTCLOUD_PG_RESTIC_REPO \
      -p /home/veerendra/pass.txt \
      --stdin-filename db_postgres_nextcloud.sql | tail -1 > /tmp/nextcloud_pg_restic_stats.json

echo "[*] Settings maintenance mode off"
docker exec -it -u www-data nextcloud php occ maintenance:mode --off
trap "" EXIT
END="$(date +%s)"
echo "AFTER"
for stat_file in /tmp/{"nextcloud_data_restic_stats.json","nextcloud_data_restic_stats.json"};
do
cat << EOF > "$TEXTFILE_COLLECTOR_DIR/backup_restic.prom.$$"
backup_last_run_epoch_seconds $END
backup_restic_summary_files_new `jq .files_new $stat_file || echo -n "-1"`
backup_restic_summary_files_changed `jq .files_changed $stat_file || echo -n ""-1""`
backup_restic_summary_files_unmodified `jq .files_unmodified $stat_file  || echo -n "-1"`
backup_restic_summary_dirs_new `jq .dirs_new $stat_file || echo -n "-1"`
backup_restic_summary_dirs_changed `jq .dirs_changed $stat_file || echo -n "-1"`
backup_restic_summary_dirs_unmodified `jq .dirs_unmodified $stat_file || echo -n "-1"`
backup_restic_summary_data_blobs `jq .data_blobs $stat_file || echo -n "-1"`
backup_restic_summary_tree_blobs `jq .tree_blobs $stat_file || echo -n "-1"`
backup_restic_summary_data_added `jq .data_added $stat_file || echo -n "-1"`
backup_restic_summary_total_files_processed `jq .total_files_processed $stat_file || echo -n "-1"`
backup_restic_summary_total_bytes_processed `jq .total_bytes_processed $stat_file || echo -n "-1"`
backup_restic_summary_total_duration `jq .total_duration $stat_file || echo -n "-1"`
backup_restic_summary_snapshot_id `jq .snapshot_id $stat_file || echo -n "-1"`
EOF
mv "$TEXTFILE_COLLECTOR_DIR/backup_restic.prom.$$" "$TEXTFILE_COLLECTOR_DIR/backup_restic.prom"
done