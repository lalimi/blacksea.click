#!/bin/bash

# Скрипт для миграции базы данных из локальной PostgreSQL в Supabase

set -e  # Прекратить выполнение при любой ошибке

# Загрузить переменные окружения
source .env.local

echo "Starting database migration to Supabase..."

# Проверка подключения к Supabase
echo "Testing connection to Supabase..."
PGPASSWORD=${DATABASE_PASSWORD} psql \
  -h ${DATABASE_HOST} \
  -p ${DATABASE_PORT} \
  -U ${DATABASE_USERNAME} \
  -d ${DATABASE_NAME} \
  -c "SELECT version();" || { echo "Cannot connect to Supabase. Please check your connection settings."; exit 1; }

echo "Connection to Supabase successful."

# Экспорт схемы и данных из локальной базы
echo "Exporting schema and data from local database..."

# Создать директорию для временных файлов
mkdir -p tmp/migration

# Экспортировать схему базы данных
pg_dump -h localhost -U ${DATABASE_USERNAME} -d gumroad_development \
  --schema-only \
  --no-owner \
  --no-privileges \
  -f tmp/migration/schema.sql

# Экспортировать данные (без бинарных данных для простоты, их нужно мигрировать отдельно)
pg_dump -h localhost -U ${DATABASE_USERNAME} -d gumroad_development \
  --data-only \
  --no-owner \
  --no-privileges \
  --exclude-table=active_storage_blobs \
  -f tmp/migration/data.sql

echo "Schema and data exported to tmp/migration directory"

# Импорт схемы в Supabase
echo "Importing schema into Supabase..."
PGPASSWORD=${DATABASE_PASSWORD} psql \
  -h ${DATABASE_HOST} \
  -p ${DATABASE_PORT} \
  -U ${DATABASE_USERNAME} \
  -d ${DATABASE_NAME} \
  -f tmp/migration/schema.sql

# Импорт данных в Supabase
echo "Importing data into Supabase..."
PGPASSWORD=${DATABASE_PASSWORD} psql \
  -h ${DATABASE_HOST} \
  -p ${DATABASE_PORT} \
  -U ${DATABASE_USERNAME} \
  -d ${DATABASE_NAME} \
  -f tmp/migration/data.sql

echo "Migration completed successfully!"
echo "Note: Binary data (like images) need to be migrated separately."

# Обновить настройки приложения для использования Supabase
echo "Don't forget to update your application configuration to use Supabase!"
echo "You can use the .env.local file for development or update your environment variables in production."