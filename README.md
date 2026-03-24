# DevOps Showcase: WordPress Stack with Monitoring & S3 Backups

Комплексный проект для демонстрации навыков Junior DevOps: от контейнеризации приложения до настройки Observability и Disaster Recovery.

## 📱 О приложении (WordPress)
В качестве основы выбран **WordPress** — самая популярная CMS в мире. Она требует связки с базой данных, объектным кэшем и веб-сервером, что делает её идеальным примером для демонстрации навыков оркестрации:
- **Backend**: PHP-FPM (внутри образа wordpress).
- **Frontend**: Nginx (как Reverse Proxy для статики и безопасности).
- **Cache**: Redis для ускорения генерации страниц.
- **Database**: MariaDB 10.6.

## 🚀 DevOps Features
- **Healthchecks**: Приложение `app` ожидает готовности БД и Redis через `service_healthy`.
- **Resource Management**: Лимиты CPU/RAM и ротация логов (10MB x 3).
- **CI/CD**: GitHub Actions автоматически валидирует конфиги.
- **Monitoring**: Полный стек Prometheus + Grafana + Node Exporter.
- **Backups**: Автоматические дампы в папку `./backups` и дублирование в **S3 Cloud**.

## 💾 Резервное копирование и восстановление
### Логика бэкапа
Скрипт `backup.sh` делает дампы каждый час и удаляет старые копии (7+ дней).
### Как восстановить данные:
```bash
./restore.sh <имя_файла.sql>
```

## 🛠 Быстрый старт
1. `cp .env.example .env`
2. `docker compose up -d`

---
*Проект подготовлен для портфолио DevOps Junior.*
