# Настройка переменных окружения

## Шаги для настройки проекта

### 1. Создание файла .env
Скопируйте файл `env.example` в `.env` в корне проекта:

```bash
cp env.example .env
```

### 2. Настройка переменных окружения

Отредактируйте файл `.env` и измените следующие значения:

#### Обязательные переменные:
- `APP_SECRET` - секретный ключ приложения (сгенерируйте случайную строку)
- `DB_PASSWORD` - пароль для базы данных PostgreSQL
- `JWT_PASSPHRASE` - пароль для JWT ключей (уже установлен: `your-passphrase-here`)

#### Пример генерации APP_SECRET:
```bash
openssl rand -hex 32
```

### 3. JWT ключи
JWT ключи уже сгенерированы в директории `www/config/jwt/`:
- `private.pem` - приватный ключ
- `public.pem` - публичный ключ
- Пароль: `your-passphrase-here`

### 4. Запуск проекта

```bash
# Запуск всех сервисов
docker-compose up -d

# Проверка статуса
docker-compose ps

# Просмотр логов
docker-compose logs -f
```

### 5. Инициализация базы данных

```bash
# Вход в контейнер PHP
docker-compose exec app bash

# Выполнение миграций
php bin/console doctrine:migrations:migrate

# Создание пользователя (если нужно)
php bin/console app:create-user
```

## Структура переменных окружения

### База данных
- `DB_DATABASE=symfony_app` - имя базы данных
- `DB_USERNAME=symfony_user` - пользователь базы данных
- `DB_PASSWORD=symfony_password` - пароль базы данных
- `DATABASE_URL` - полный URL подключения к базе данных

### Redis
- `REDIS_URL=redis://redis:6379` - URL для подключения к Redis

### JWT Аутентификация
- `JWT_SECRET_KEY` - путь к приватному ключу
- `JWT_PUBLIC_KEY` - путь к публичному ключу
- `JWT_PASSPHRASE` - пароль для ключей

### CORS
- `CORS_ALLOW_ORIGIN` - разрешенные домены для CORS

## Порты
- **Nginx**: 8000 (http://localhost:8000)
- **PostgreSQL**: 5432
- **Redis**: 6379

## Полезные команды

```bash
# Остановка всех сервисов
docker-compose down

# Пересборка контейнеров
docker-compose up --build

# Очистка кеша Symfony
docker-compose exec app php bin/console cache:clear

# Просмотр логов конкретного сервиса
docker-compose logs -f app
docker-compose logs -f nginx
docker-compose logs -f db
```
