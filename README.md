# Dockerized WordPress Stack with Monitoring & Backups

Это комплексный проект инфраструктуры (Self-hosted Blog), демонстрирующий навыки Junior DevOps: контейнеризацию, мониторинг, CI/CD и стратегию сохранения данных.

## 🚀 DevOps Features

- **Стек**: WordPress, MariaDB, Redis, Nginx.
- **Мониторинг**: Сбор метрик (Prometheus + Node Exporter) и визуализация (Grafana).
- **Автоматические бэкапы**: Отдельный сервис `backup` создает дампы БД каждый час и хранит их 7 дней (Retention Policy).
- **CI/CD**: GitHub Actions автоматически проверяет синтаксис Compose-файла при каждом пуше.
- **Оптимизация**: Лимиты ресурсов (CPU/RAM) и ротация логов (10MB x 3).

## 🛠 Доступы к сервисам

- **WordPress**: [http://localhost](http://localhost)
- **Grafana**: [http://localhost:3000](http://localhost:3000) (admin/admin)
- **Бэкапы**: Локальная папка `./backups` (скрыта из Git для безопасности).

## 📦 Быстрый старт

1. **Конфигурация**:
   ```bash
   cp .env.example .env
   mkdir -p backups
   ```

2. **Запуск**:
   ```bash
   docker compose up -d
   ```

## 💾 Схема бэкапов
Сервис бэкапа выполняет `mariadb-dump` по расписанию. Файлы именуются по дате: `blog_db_YYYY-MM-DD_HH-MM.sql`. Скрипт автоматически удаляет файлы старше 7 суток, чтобы не переполнять диск.

---
*Проект выполнен для демонстрации навыков DevOps Junior.*
