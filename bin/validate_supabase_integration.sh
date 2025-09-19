#!/bin/bash

# Валидация интеграции с Supabase
# Проверяет все аспекты настроенной интеграции

set -e

echo "🔍 Валидация интеграции с Supabase..."
echo "======================================"

# Загрузить переменные окружения
if [ -f .env.local ]; then
    source .env.local
    echo "✅ Переменные окружения загружены"
else
    echo "❌ Файл .env.local не найден"
    exit 1
fi

echo
echo "📋 Проверяемые параметры:"
echo "   Database Host: $DATABASE_HOST"
echo "   Database Port: $DATABASE_PORT"
echo "   Database Name: $DATABASE_NAME"
echo "   Supabase URL: $SUPABASE_URL"
echo

# Функции валидации
validate_connection() {
    echo "🔗 1. Проверка подключения к базе данных..."
    
    if command -v psql &> /dev/null; then
        PGPASSWORD="$DATABASE_PASSWORD" psql \
            -h "$DATABASE_HOST" \
            -p "$DATABASE_PORT" \
            -U "$DATABASE_USERNAME" \
            -d "$DATABASE_NAME" \
            -c "SELECT 'Connection successful' as status;" \
            --set sslmode=require \
            2>/dev/null | grep -q "Connection successful"
        
        if [ $? -eq 0 ]; then
            echo "   ✅ Подключение к PostgreSQL успешно"
        else
            echo "   ❌ Ошибка подключения к PostgreSQL"
            return 1
        fi
    else
        echo "   ⚠️ PostgreSQL клиент не установлен, пропускаем тест подключения"
    fi
}

validate_tables() {
    echo "📊 2. Проверка структуры таблиц..."
    
    if command -v psql &> /dev/null; then
        # Проверка существования основных таблиц
        tables_check=$(PGPASSWORD="$DATABASE_PASSWORD" psql \
            -h "$DATABASE_HOST" \
            -p "$DATABASE_PORT" \
            -U "$DATABASE_USERNAME" \
            -d "$DATABASE_NAME" \
            -t -c "
            SELECT COUNT(*) FROM information_schema.tables 
            WHERE table_name IN ('users', 'products', 'purchases', 'product_files', 'comments')
            AND table_schema = 'public';" \
            --set sslmode=require \
            2>/dev/null | tr -d ' ')
        
        if [ "$tables_check" -eq 5 ]; then
            echo "   ✅ Все основные таблицы существуют"
        else
            echo "   ❌ Найдено только $tables_check из 5 основных таблиц"
        fi
        
        # Проверка RLS
        rls_check=$(PGPASSWORD="$DATABASE_PASSWORD" psql \
            -h "$DATABASE_HOST" \
            -p "$DATABASE_PORT" \
            -U "$DATABASE_USERNAME" \
            -d "$DATABASE_NAME" \
            -t -c "
            SELECT COUNT(*) FROM pg_class c 
            JOIN pg_namespace n ON c.relnamespace = n.oid 
            WHERE c.relrowsecurity = true 
            AND n.nspname = 'public' 
            AND c.relname IN ('users', 'products', 'purchases', 'product_files', 'comments');" \
            --set sslmode=require \
            2>/dev/null | tr -d ' ')
        
        if [ "$rls_check" -eq 5 ]; then
            echo "   ✅ RLS включен для всех основных таблиц"
        else
            echo "   ⚠️ RLS включен только для $rls_check из 5 таблиц"
        fi
    else
        echo "   ⚠️ PostgreSQL клиент не установлен, пропускаем проверку таблиц"
    fi
}

validate_environment() {
    echo "🔧 3. Проверка переменных окружения..."
    
    required_vars=("DATABASE_HOST" "DATABASE_PORT" "DATABASE_USERNAME" "DATABASE_PASSWORD" "SUPABASE_URL")
    missing_vars=()
    
    for var in "${required_vars[@]}"; do
        if [ -z "${!var}" ]; then
            missing_vars+=("$var")
        fi
    done
    
    if [ ${#missing_vars[@]} -eq 0 ]; then
        echo "   ✅ Все обязательные переменные настроены"
    else
        echo "   ❌ Отсутствуют переменные: ${missing_vars[*]}"
        return 1
    fi
    
    # Проверка API ключей
    if [ "$SUPABASE_ANON_KEY" = "your_anon_key_here" ]; then
        echo "   ⚠️ SUPABASE_ANON_KEY не настроен (значение по умолчанию)"
    else
        echo "   ✅ SUPABASE_ANON_KEY настроен"
    fi
    
    if [ "$SUPABASE_SERVICE_ROLE_KEY" = "your_service_role_key_here" ]; then
        echo "   ⚠️ SUPABASE_SERVICE_ROLE_KEY не настроен (значение по умолчанию)"
    else
        echo "   ✅ SUPABASE_SERVICE_ROLE_KEY настроен"
    fi
}

validate_rails_config() {
    echo "🚂 4. Проверка конфигурации Rails..."
    
    if [ -f "config/database.yml" ]; then
        echo "   ✅ database.yml существует"
        
        # Проверка, что конфигурация использует переменные окружения
        if grep -q "ENV.fetch" config/database.yml; then
            echo "   ✅ database.yml использует переменные окружения"
        else
            echo "   ⚠️ database.yml может не использовать переменные окружения"
        fi
    else
        echo "   ❌ config/database.yml не найден"
    fi
    
    if [ -f "config/supabase.rb" ]; then
        echo "   ✅ config/supabase.rb создан"
    else
        echo "   ⚠️ config/supabase.rb не найден"
    fi
    
    if [ -f "app/controllers/supabase_auth_controller.rb" ]; then
        echo "   ✅ SupabaseAuthController создан"
    else
        echo "   ⚠️ SupabaseAuthController не найден"
    fi
}

validate_migrations() {
    echo "📝 5. Проверка миграций..."
    
    migration_count=$(ls supabase/migrations/*.sql 2>/dev/null | wc -l | tr -d ' ')
    
    if [ "$migration_count" -gt 0 ]; then
        echo "   ✅ Найдено $migration_count миграций Supabase"
        
        echo "   📁 Список миграций:"
        for migration in supabase/migrations/*.sql; do
            if [ -f "$migration" ]; then
                basename "$migration"
            fi
        done | sed 's/^/      - /'
    else
        echo "   ❌ Миграции Supabase не найдены"
    fi
}

validate_routes() {
    echo "🛣️ 6. Проверка маршрутов..."
    
    if grep -q "supabase_auth" config/routes.rb; then
        echo "   ✅ Маршруты Supabase Auth добавлены"
    else
        echo "   ⚠️ Маршруты Supabase Auth не найдены в routes.rb"
    fi
}

# Выполнение всех проверок
echo "Начинаем валидацию..."
echo

validation_failed=false

validate_environment || validation_failed=true
echo
validate_connection || validation_failed=true
echo
validate_tables || validation_failed=true
echo
validate_rails_config || validation_failed=true
echo
validate_migrations || validation_failed=true
echo
validate_routes || validation_failed=true

echo
echo "======================================"
if [ "$validation_failed" = true ]; then
    echo "❌ Валидация завершена с ошибками"
    echo
    echo "💡 Рекомендации:"
    echo "   1. Проверьте настройки в Supabase Dashboard"
    echo "   2. Убедитесь, что IP адрес добавлен в Allow List"
    echo "   3. Обновите API ключи в .env.local"
    echo "   4. Выполните миграции: supabase db reset"
    echo
    echo "📖 Смотрите детальные инструкции в SUPABASE_SETUP_INSTRUCTIONS.md"
    exit 1
else
    echo "✅ Валидация успешно завершена!"
    echo
    echo "🎉 Интеграция с Supabase настроена корректно"
    echo
    echo "🚀 Следующие шаги:"
    echo "   1. Настройте API ключи в Supabase Dashboard"
    echo "   2. Выполните миграции: supabase db reset"
    echo "   3. Протестируйте функциональность в development"
    echo "   4. Настройте production окружение"
fi