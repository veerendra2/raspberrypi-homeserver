#!/bin/bash
# Author: Veerendra K
# Description: Run restic backup and writes metrics to file for node exporter's textfile collector
# Dependencies: restic, jq
#
# ** INFO ***
# https://www.robustperception.io/using-the-textfile-collector-from-a-shell-script/
# https://github.com/prometheus/node_exporter
# Set --collector.textfile.directory in node_exporter


RESTIC_REPO="/home/veerendra/restic-test"
RESTIC_BACKUP_DIR="/home/veerendra/projects"
RESTIC_PASSWORD_FILE="/home/veerendra/pass.txt"
TEXTFILE_COLLECTOR_DIR="."

START="$(date +%s)"

restic -r $RESTIC_REPO \
      --json \
      -p $RESTIC_PASSWORD_FILE \
      backup $RESTIC_BACKUP_DIR | tail -1 > /tmp/restic_stats.json

END="$(date +%s)"

cat << EOF > "$TEXTFILE_COLLECTOR_DIR/backup_restic.prom.$$"
backup_duration_seconds $(($END - $START))
backup_last_run_epoch_seconds $END
backup_restic_summary_files_new `jq .files_new /tmp/restic_stats.json`
backup_restic_summary_files_changed `jq .files_changed /tmp/restic_stats.json`
backup_restic_summary_files_unmodified `jq .files_unmodified /tmp/restic_stats.json`
backup_restic_summary_dirs_new `jq .dirs_new /tmp/restic_stats.json`
backup_restic_summary_dirs_changed `jq .dirs_changed /tmp/restic_stats.json`
backup_restic_summary_dirs_unmodified `jq .dirs_unmodified /tmp/restic_stats.json`
backup_restic_summary_data_blobs `jq .data_blobs /tmp/restic_stats.json`
backup_restic_summary_tree_blobs `jq .tree_blobs /tmp/restic_stats.json`
backup_restic_summary_data_added `jq .data_added /tmp/restic_stats.json`
backup_restic_summary_total_files_processed `jq .total_files_processed /tmp/restic_stats.json`
backup_restic_summary_total_bytes_processed `jq .total_bytes_processed /tmp/restic_stats.json`
backup_restic_summary_total_duration `jq .total_duration /tmp/restic_stats.json`
backup_restic_summary_snapshot_id `jq .snapshot_id /tmp/restic_stats.json`
EOF

mv "$TEXTFILE_COLLECTOR_DIR/backup_restic.prom.$$" "$TEXTFILE_COLLECTOR_DIR/backup_restic.prom"