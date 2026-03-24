# Production-Ready WordPress Stack: Monitoring, CI/CD & S3 Backups

Комплексный проект инфраструктуры (Self-hosted Blog), демонстрирующий навыки Junior DevOps: контейнеризацию, Observability, автоматизацию бэкапов и Cloud-интеграцию.

## 🏗 Архитектура системы

- **Application Layer**: WordPress + Redis (Object Cache) + Nginx (Reverse Proxy).
- **Database Layer**: MariaDB 10.6 с выделенным томом для данных.
- **Monitoring Layer**: Prometheus (метрики) + Grafana (дашборды) + Node Exporter (метрики хоста).
- **Data Protection**: Автономный сервис бэкапов с выгрузкой в облако (S3).

## 🚀 DevOps Features

- **Healthchecks**: Приложение `app` ожидает полной готовности БД и Redis (через `service_healthy`).
- **Resource Management**: Лимиты CPU/RAM (Deploy limits) и ротация логов (10MB x 3).
- **Infrastructure as Code**: GitHub Actions автоматически проверяет синтаксис Compose-файла.
- **Modular Scripts**: Вся логика бэкапа и восстановления вынесена в внешние `.sh` файлы.

## 💾 Стратегия резервного копирования (3-2-1)

Проект реализует автоматизированный цикл защиты данных через сервис `backup`:

1.  **Локальные дампы**: Скрипт `backup.sh` создает `.sql` файлы каждый час в папке `./backups`.
2.  **Retention Policy**: Автоматическое удаление локальных копий старше 7 дней (`find -mtime +7`).
3.  **Offsite Cloud Backup**: При заполнении S3-переменных в `.env`, дампы дублируются в облако (AWS S3, Yandex Cloud, Selectel).

### Как восстановить данные:
Используйте вспомогательный скрипт с хоста:
```bash
chmod +x restore.sh
./restore.sh blog_db_2024-05-20_14-00.sql
```

## 📊 Мониторинг

- **Grafana**: [http://localhost:3000](http://localhost:3000) (admin/admin).
- **Prometheus**: [http://localhost:9090](http://localhost:9090).
- **Инструкция**: Добавьте Prometheus как Data Source (`http://prometheus:9090`) и импортируйте дашборд ID `1860`.

## 📦 Быстрый старт

1.  **Подготовка**:
    ```bash
    cp .env.example .env
    chmod +x backup.sh restore.sh
    mkdir -p backups
    ```
2.  **Запуск**:
    ```bash
    docker compose up -d
    ```

---
*Проект подготовлен для демонстрации навыков Junior DevOps Engineer.*
