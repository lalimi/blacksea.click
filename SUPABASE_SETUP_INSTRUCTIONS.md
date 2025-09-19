# 🔧 Инструкция по настройке Supabase Dashboard

## 🎯 Цель
Настроить доступ к базе данных Supabase для успешного подключения из приложения.

## 📋 Шаги настройки в Supabase Dashboard

### 1. Войдите в Supabase Dashboard
- Перейдите на https://supabase.com/dashboard
- Войдите в свой аккаунт
- Выберите проект `qewjnagvsbnwgamrrrwg`

### 2. Включите Direct Database Access
1. Перейдите в **Settings** (⚙️) → **Database**
2. Найдите секцию **Connection parameters**
3. Убедитесь, что включена опция **"Allow Direct Database Access"**

### 3. Настройте IP Allow List
1. В той же секции **Database** найдите **"Network Restrictions"**
2. Нажмите **"Add new restriction"**
3. Добавьте ваш IP адрес. Узнать текущий IP можно:
   ```bash
   curl ifconfig.me
   ```
4. Или добавьте `0.0.0.0/0` для разрешения всех IP (только для разработки!)

### 4. Проверьте Connection Pooling
1. В секции **Database** найдите **"Connection Pooling"**
2. Убедитесь, что режим установлен на **Transaction**
3. Запишите **Connection string** для pooler (если используется)

### 5. Получите правильные параметры подключения
В секции **Database** → **Connection parameters** найдите:
- **Host**: должен быть `qewjnagvsbnwgamrrrwg.supabase.co`
- **Port**: `5432` (direct) или `6543` (pooler)
- **Database name**: `postgres`
- **Username**: `postgres`
- **Password**: ваш пароль проекта

## ✅ Проверка настроек

После настройки Dashboard выполните:

```bash
cd /Users/lalitamirosnicenko/printnplay/gumroad
./bin/test_supabase_connection.sh
```

## 🔄 Если подключение все еще не работает

### Вариант 1: Использование Supabase JavaScript SDK
Можно использовать Supabase JS SDK вместо прямого подключения к PostgreSQL.

### Вариант 2: Использование REST API
Supabase предоставляет REST API для работы с данными через HTTP запросы.

### Вариант 3: Проверка сетевых настроек
- Попробуйте подключиться с другой сети
- Проверьте настройки брандмауэра
- Убедитесь, что не используется VPN, который может блокировать соединение

## 🆘 Получение помощи

Если проблемы продолжаются:
1. Проверьте логи в Supabase Dashboard → **Logs**
2. Обратитесь в поддержку Supabase через Dashboard
3. Проверьте статус сервисов на https://status.supabase.com