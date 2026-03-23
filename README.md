# Dockerized WordPress Stack with Monitoring (DevOps Practice)

Это расширенный учебный проект, демонстрирующий навыки развертывания отказоустойчивой инфраструктуры с мониторингом (Prometheus/Grafana) и оптимизацией ресурсов.

## 🚀 Основные фичи (DevOps Level-Up)

- **Полный стек**: WordPress, MariaDB, Redis, Nginx.
- **Мониторинг (Observability)**: 
  - **Prometheus** собирает метрики системы.
  - **Node Exporter** отдает данные о железе (CPU, RAM, Disk).
  - **Grafana** визуализирует состояние серверов.
- **Безопасность**: Полная изоляция в `app-network`, пароли в `.env`.
- **Infrastructure as Code**: Автоматическая проверка синтаксиса через **GitHub Actions**.
- **Оптимизация**: Лимиты ресурсов (limits) и ротация логов для стабильности хоста.

## 🛠 Доступы к сервисам

- **Сайт (WordPress)**: [http://localhost](http://localhost)
- **Мониторинг (Grafana)**: [http://localhost:3000](http://localhost:3000)
  - **Логин**: `admin`
  - **Пароль**: `admin` (потребует смены при первом входе)
- **Метрики (Prometheus)**: [http://localhost:9090](http://localhost:9090)

## 📦 Быстрый старт

1. **Подготовьте окружение**:
   ```bash
   cp .env.example .env
   # Отредактируйте .env при необходимости
   ```

2. **Запустите всю инфраструктуру**:
   ```bash
   docker compose up -d
   ```

3. **Проверьте статус**:
   ```bash
   docker compose ps
   ```

## 📊 Как настроить графики в Grafana

1. Зайдите в Grafana (`localhost:3000`).
2. Перейдите в **Connections** -> **Data Sources**.
3. Нажмите **Add data source** -> **Prometheus**.
4. В поле URL введите: `http://prometheus:9090` и нажмите **Save & Test**.
5. Чтобы быстро получить крутой дашборд:
   - Нажмите **Dashboards** -> **New** -> **Import**.
   - Введите ID `1860` (Node Exporter Full) и нажмите **Load**.

---
*Проект реализован в рамках практики по Docker, Docker Compose и CI/CD.*
