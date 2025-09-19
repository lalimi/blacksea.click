#!/bin/bash

# Скрипт для диагностики подключения к Supabase

echo "🔍 Диагностика подключения к Supabase..."
echo

# Загрузить переменные окружения
if [ -f .env.local ]; then
    source .env.local
    echo "✅ Переменные окружения загружены"
else
    echo "❌ Файл .env.local не найден"
    exit 1
fi

echo "📋 Параметры подключения:"
echo "Host: $DATABASE_HOST"
echo "Port: $DATABASE_PORT"
echo "Database: $DATABASE_NAME"
echo "Username: $DATABASE_USERNAME"
echo "SSL: $DATABASE_SSL"
echo

# Проверка доступности хоста
echo "1. Проверка доступности хоста..."
if ping -c 3 "$DATABASE_HOST" > /dev/null 2>&1; then
    echo "✅ Хост доступен"
else
    echo "❌ Хост недоступен"
    exit 1
fi

# Проверка порта
echo
echo "2. Проверка доступности порта $DATABASE_PORT..."
python3 -c "
import socket
import sys
try:
    sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    sock.settimeout(10)
    result = sock.connect_ex(('$DATABASE_HOST', $DATABASE_PORT))
    sock.close()
    if result == 0:
        print('✅ Порт доступен')
        sys.exit(0)
    else:
        print('❌ Порт недоступен - код ошибки:', result)
        sys.exit(1)
except Exception as e:
    print('❌ Ошибка соединения:', e)
    sys.exit(1)
"

if [ $? -eq 0 ]; then
    echo
    echo "3. Попытка подключения к PostgreSQL..."
    
    # Проверка установки psql
    if ! command -v psql &> /dev/null; then
        echo "❌ PostgreSQL клиент (psql) не установлен"
        echo "💡 Установите PostgreSQL: brew install postgresql"
        exit 1
    fi
    
    # Попытка подключения
    PGPASSWORD="$DATABASE_PASSWORD" psql \
        -h "$DATABASE_HOST" \
        -p "$DATABASE_PORT" \
        -U "$DATABASE_USERNAME" \
        -d "$DATABASE_NAME" \
        -c "SELECT version();" \
        --set sslmode=require \
        2>/dev/null
    
    if [ $? -eq 0 ]; then
        echo "✅ Подключение к базе данных успешно!"
    else
        echo "❌ Не удалось подключиться к базе данных"
        echo "💡 Проверьте настройки в Supabase Dashboard:"
        echo "   - Project Settings -> Database"
        echo "   - Убедитесь, что включен 'Direct database access'"
        echo "   - Добавьте свой IP в 'IP Allow List'"
    fi
else
    echo "💡 Возможные причины:"
    echo "   1. IP адрес не добавлен в Allow List в Supabase Dashboard"
    echo "   2. Настройки сети или брандмауэра блокируют соединение"
    echo "   3. Неверные параметры подключения"
fi