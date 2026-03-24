#!/bin/bash

# Загружаем переменные из .env, чтобы знать пароль
if [ -f .env ]; then
  export $(grep -v '^#' .env | xargs)
fi

if [ -z "$1" ]; then
  echo "Использование: ./restore.sh <имя_файла_из_папки_backups>"
  exit 1
fi

FILE="backups/$1"

if [ ! -f "$FILE" ]; then
  echo "Ошибка: Файл $FILE не найден!"
  exit 1
fi

echo "Восстановление базы данных из $FILE..."
# Используем переменную $DB_PASSWORD и флаг -p без пробела
docker compose exec -T db mariadb -u "$DB_USER" -p"$DB_PASSWORD" "$DB_NAME" < "$FILE"

if [ $? -eq 0 ]; then
  echo "✅ Восстановление успешно завершено!"
else
  echo "❌ Ошибка при восстановлении!"
  exit 1
fi
