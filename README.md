# DevOps Portfolio: WordPress Stack + Monitoring + S3 Backups

Комплексная инфраструктура в одном Docker Compose файле. Проект демонстрирует навыки автоматизации, мониторинга и Disaster Recovery.

## 🛠 Технологический стек (Тезисно)
- **App**: WordPress + Redis (Object Cache) + Nginx (Reverse Proxy).
- **Database**: MariaDB 10.6 (Persistent Storage).
- **Monitoring**: Prometheus + Grafana + Node Exporter.
- **Automation**: CI/CD (GitHub Actions), Backup Sidecar (Cron-like script).

## 🚀 Быстрый старт
1. **Подготовка**:
   ```bash
   cp .env.example .env && mkdir -p backups
   chmod +x backup.sh restore.sh
   ```
2. **Запуск**:
   ```bash
   docker compose up -d
   ```
3. **Доступы**:
   - **Сайт**: [http://localhost](http://localhost)
   - **Grafana**: [http://localhost:3000](http://localhost:3000) (admin/admin)

## 💾 Работа с бэкапами (Backup & Restore)

### Логика бэкапирования
Сервис `backup` ежечасно запускает `backup.sh`.
- **Локально**: Файлы сохраняются в папку `./backups`.
- **Облако**: Если в `.env` указаны S3-ключи, дампы дублируются в S3.
- **Очистка**: Локальные дампы старше 7 дней удаляются автоматически.

### Как восстановить данные
Используйте готовый скрипт на хосте (передав имя файла из папки backups):
```bash
./restore.sh blog_db_2024-05-20_14-00.sql
```

## 📊 Настройка мониторинга
1. Зайдите в Grafana -> **Data Sources** -> **Add Prometheus**.
2. Введите URL: `http://prometheus:9090` -> **Save & Test**.
3. Нажмите **Import Dashboard** -> ID: `1860` (Node Exporter Full).

## 🛡 Безопасность и CI/CD
- **Secrets**: Все пароли только в `.env` (игнорируется гитом).
- **Linter**: GitHub Actions проверяет синтаксис YAML при каждом `git push`.
- **Limits**: Ограничение ресурсов (CPU/RAM) для каждого контейнера.

---
*Проект подготовлен для демонстрации навыков DevOps Junior.*
