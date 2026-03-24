# DevOps Portfolio: WordPress Stack with S3 Offsite Backups

## 💾 Резервное копирование (3-2-1 Strategy)
Проект реализует базовый принцип надежности бэкапов:
1. **Local**: Дампы хранятся в директории `./backups`.
2. **Offsite (S3)**: Скрипт автоматически дублирует архивы в S3-совместимое облако.
3. **Retention**: Локальные копии старше 7 дней удаляются автоматически.

## 🛠 Настройка S3
Для активации облачных бэкапов заполните следующие поля в `.env`:
- `S3_BUCKET`, `S3_ACCESS_KEY`, `S3_SECRET_KEY` и `S3_ENDPOINT`.

## 📦 Быстрый старт
```bash
cp .env.example .env
docker compose up -d
```
