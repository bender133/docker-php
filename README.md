# Docker PHP Development Environment

Docker-окружение для разработки на PHP с Symfony, PostgreSQL и Redis.

## Сервисы

- **PHP 8.3-FPM** - Основной контейнер приложения
- **PostgreSQL 16** - База данных с расширением pgvector
- **Redis 7** - Кэширование и хранение сессий
- **Nginx** - Веб-сервер

## Быстрый старт

1. Скопируйте `.env.example` в `.env` и настройте переменные окружения
2. Запустите `docker-compose up -d` для старта всех сервисов
3. Приложение будет доступно по адресу `http://localhost:8000`

## Разработка

- PHP код находится в директории `www/`
- Миграции базы данных: `docker exec php-app php bin/console doctrine:migrations:migrate`
- Зависимости Composer управляются в директории `www/`

## Полезные команды

```bash
# Запуск сервисов
docker-compose up -d

# Остановка сервисов
docker-compose down

# Просмотр логов
docker-compose logs -f

# Доступ к PHP контейнеру
docker exec -it php-app bash

# Команды Composer
docker exec php-app composer install
docker exec php-app composer update

# Команды Symfony
docker exec php-app php bin/console cache:clear
docker exec php-app php bin/console doctrine:migrations:migrate
```

## Конфигурация

- PHP: `Dockerfile` (PHP 8.3-FPM)
- Nginx: `nginx/conf.d/default.conf`
- База данных: файл `.env`