#!/bin/sh
while true; do
  echo "$(date): Starting backup of ${DB_NAME}..."
  mariadb-dump -h ${DB_HOST} -u ${DB_USER} -p${DB_PASSWORD} ${DB_NAME} > /backups/${DB_NAME}_$(date +%Y-%m-%d_%H-%M).sql
  echo "$(date): Backup completed. Cleaning old files (7+ days)..."
  find /backups -type f -mtime +7 -delete
  sleep 3600
done
