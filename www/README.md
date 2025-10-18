# AI Knowledge Hub

REST API для управления знаниями с использованием AI, построенный на Symfony 7 с PostgreSQL и Redis.

## Возможности

- **Загрузка документов** - поддержка Markdown, TXT, HTML и других форматов
- **Извлечение текста** - автоматическое извлечение контента и метаданных
- **Векторные эмбеддинги** - генерация эмбеддингов для семантического поиска
- **AI поиск** - поиск релевантных документов по запросам
- **Очереди** - асинхронная обработка документов через Redis

## Технологии

- **PHP 8.3** - современный PHP с новыми возможностями
- **Symfony 7.2** - полнофункциональный фреймворк
- **PostgreSQL 16** - реляционная база данных с pgvector
- **Redis 7** - кэш и очереди сообщений
- **Doctrine ORM** - работа с базой данных
- **Symfony Messenger** - асинхронная обработка
- **Docker** - контейнеризация приложения

## Архитектурные паттерны

- **Domain-Driven Design (DDD)** - разделение на слои
- **Clean Architecture** - Domain, Application, Infrastructure, UI
- **Repository Pattern** - работа с данными
- **Service Layer** - бизнес-логика
- **Event-Driven Architecture** - события
- **CQRS** - разделение команд и запросов

## Установка и запуск

### 1. Клонирование и настройка

```bash
# Перейти в папку проекта
cd /Users/vadimelkin/PhpstormProjects/docker

# Запустить Docker контейнеры
docker-compose up -d

# Установить зависимости
docker-compose exec app composer install

# Создать базу данных
docker-compose exec app php bin/console doctrine:database:create

# Выполнить миграции
docker-compose exec app php bin/console doctrine:migrations:migrate --no-interaction
```

### 2. Доступ к API

- **API Base URL**: http://localhost:8000/api
- **Health Check**: http://localhost:8000/api/health

## API Endpoints

### Health Check
- `GET /api/health` - проверка работы API и подключения к БД

### Документы (планируется)
- `POST /api/documents` - загрузка документа
- `GET /api/documents` - список документов
- `GET /api/documents/{id}` - получение документа
- `DELETE /api/documents/{id}` - удаление документа

### Поиск (планируется)
- `POST /api/search` - поиск по документам
- `GET /api/search/suggestions` - предложения для поиска

## Структура проекта

```
www/
├── config/                 # Конфигурационные файлы
│   ├── packages/          # Конфигурация пакетов
│   └── routes.yaml        # Маршруты
├── public/                # Публичная папка
│   └── index.php         # Точка входа
├── src/                   # Исходный код
│   ├── Controller/        # Контроллеры
│   ├── Entity/           # Сущности Doctrine
│   ├── Service/          # Сервисы
│   ├── Message/          # Сообщения для очередей
│   └── Kernel.php        # Ядро приложения
├── tests/                 # Тесты
├── var/                   # Временные файлы
└── vendor/                # Зависимости Composer
```

## Полезные команды

```bash
# Очистка кэша
docker-compose exec app php bin/console cache:clear

# Создание миграции
docker-compose exec app php bin/console make:migration

# Запуск миграций
docker-compose exec app php bin/console doctrine:migrations:migrate

# Создание сущности
docker-compose exec app php bin/console make:entity

# Создание контроллера
docker-compose exec app php bin/console make:controller

# Просмотр маршрутов
docker-compose exec app php bin/console debug:router

# Просмотр очередей
docker-compose exec app php bin/console debug:messenger
```

## Подключение к сервисам

### PostgreSQL (DBeaver)
- **Host**: localhost
- **Port**: 5432
- **Database**: knowledge_hub
- **Username**: postgres
- **Password**: password

### Redis (Redis Desktop Manager)
- **Host**: localhost
- **Port**: 6379
- **Database**: 0

## Лицензия

Этот проект создан для изучения Symfony 7, PostgreSQL, Redis и современных архитектурных паттернов.