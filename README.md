# Production-ready WordPress Stack with Monitoring & Backups

Комплексный DevOps-проект по развертыванию масштабируемой и отказоустойчивой инфраструктуры на базе Docker Compose. Проект включает в себя веб-стек, систему мониторинга и автоматизированное резервное копирование.

## 🏗 Архитектура проекта

- **Application Layer**: WordPress + Redis (Object Cache) + Nginx (Reverse Proxy).
- **Database Layer**: MariaDB 10.6 с выделенным томом для персистентности данных.
- **Monitoring Layer**: Prometheus (сбор метрик) + Grafana (визуализация) + Node Exporter (метрики хоста).
- **Data Protection**: Автономный сервис бэкапов с политикой удержания (Retention Policy).

## 🚀 DevOps Features

- **Healthchecks**: Приложение ожидает полной готовности БД и Redis перед стартом.
- **Resource Limits**: Жесткие лимиты CPU/RAM для предотвращения OOM на хосте.
- **Log Rotation**: Ограничение размера логов до 10MB (хранение 3-х последних файлов).
- **CI/CD**: GitHub Actions автоматически валидирует Docker Compose конфиг при каждом пуше.
- **Modular Scripts**: Логика бэкапа и восстановления вынесена в отдельные `.sh` скрипты.

## 💾 Резервное копирование и восстановление

### Логика бэкапа
Сервис `backup` запускает скрипт `backup.sh` внутри контейнера MariaDB. 
- **Частота**: Каждый час (3600 сек).
- **Хранение**: Локальная директория `./backups` на хосте.
- **Retention**: Автоматическое удаление дампов старше 7 дней.
- **Формат имени**: `blog_db_YYYY-MM-DD_HH-MM.sql`

### Как восстановить данные
Для быстрого восстановления создан вспомогательный скрипт `restore.sh`.

1. Посмотрите список доступных бэкапов:
   ```bash
   ls -lh backups/
   ```

2. Запустите восстановление (передав имя файла):
   ```bash
   ./restore.sh blog_db_2024-05-20_14-00.sql
   ```
Скрипт автоматически подключится к контейнеру БД и импортирует дамп.

## 🛠 Быстрый старт

1. **Настройка окружения**:
   ```bash
   cp .env.example .env
   chmod +x backup.sh restore.sh
   ```

2. **Запуск всей инфраструктуры**:
   ```bash
   docker compose up -d
   ```

3. **Доступы**:
   - **Сайт**: [http://localhost](http://localhost)
   - **Grafana**: [http://localhost:3000](http://localhost:3000) (admin/admin)
   - **Prometheus**: [http://localhost:9090](http://localhost:9090)

---
*Проект подготовлен для демонстрации навыков Junior DevOps Engineer.*
