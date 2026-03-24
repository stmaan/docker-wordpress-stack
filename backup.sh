#!/bin/sh
while true; do
  TIMESTAMP=$(date +%Y-%m-%d_%H-%M)
  FILENAME="${DB_NAME}_${TIMESTAMP}.sql"
  
  echo "$(date): Starting backup of ${DB_NAME}..."
  mariadb-dump -h ${DB_HOST} -u ${DB_USER} -p${DB_PASSWORD} ${DB_NAME} > /backups/${FILENAME}

  if [ -n "${S3_BUCKET}" ]; then
    echo "$(date): Uploading ${FILENAME} to S3 bucket ${S3_BUCKET}..."
    # Простейшая загрузка через rclone (нужно настроить конфиг или переменные)
    # Для примера используем curl в S3 API или rclone, если он предустановлен
    echo "S3 Upload simulated for ${FILENAME}" 
  fi

  echo "$(date): Cleaning old files (7+ days)..."
  find /backups -type f -mtime +7 -delete
  sleep 3600
done
