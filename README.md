# Dockerized WordPress Stack (DevOps Practice)

Это учебный проект для демонстрации навыков контейнеризации и оркестрации стека (WordPress + MariaDB + Redis + Nginx) с использованием Docker Compose.

## 🚀 Что реализовано (DevOps Features)

- **Оркестрация**: Связка из 4 сервисов в изолированной сети `app-network`.
- **Безопасность**: Все чувствительные данные (пароли, имена БД) вынесены в `.env` файл.
- **Отказоустойчивость (Healthchecks)**: Настроены проверки состояния для всех сервисов. Приложение `app` не запустится, пока БД и Redis не подтвердят готовность к работе.
- **Resource Management**: Установлены жесткие лимиты (Limits) на CPU и RAM для каждого контейнера, чтобы предотвратить деградацию системы.
- **Log Management**: Настроена ротация логов (max-size: 10MB, max-file: 3) для защиты дискового пространства.
- **Reverse Proxy**: Nginx настроен как входная точка для проксирования трафика на контейнер приложения.

## 🛠 Технологический стек
- **Docker / Docker Compose**
- **Nginx** (Web Server & Proxy)
- **MariaDB** (Database)
- **Redis** (Cache)
- **WordPress** (Application)

## 📦 Как запустить

1. **Клонируйте репозиторий:**
   ```bash
   git clone <your-repo-url>
   cd <project-folder>
   ```

2. **Настройте переменные окружения:**
   Скопируйте пример файла или создайте свой `.env`:
   ```bash
   # Пример .env
   DB_NAME=blog_db
   DB_USER=admin_user
   DB_PASSWORD=secret_pass
   DB_ROOT_PASSWORD=root_pass
   APP_MEMORY=512M
   DB_MEMORY=1G
   ```

3. **Запустите стек:**
   ```bash
   docker-compose up -d
   ```

4. **Проверьте статус сервисов:**
   ```bash
   docker-compose ps
   ```

## 🔍 Мониторинг и проверка
- Сайт доступен по адресу: `http://localhost`
- Проверка доступности Redis: `docker-compose exec redis redis-cli ping`
- Просмотр логов: `docker-compose logs -f nginx`

---
*Проект выполнен в рамках освоения навыков DevOps Junior.*
