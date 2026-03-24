#!/bin/bash
# Проверка наличия аргумента (имени файла)
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
docker-compose exec -T db mariadb -u admin_user -p blog_db < "$FILE"
echo "✅ Готово!"
