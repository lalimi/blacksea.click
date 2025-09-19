# Troubleshooting Guide - Gumroad Rails App

Этот файл содержит документацию по решению типичных проблем, возникающих в процессе разработки.

## 1. React-on-Rails Оптимизация и Ошибки

### Проблема: "react-on-rails includes ~14KB of server-rendering code"
**Симптомы:**
- Консольное предупреждение об оптимизации
- Увеличенный размер бандла

**Решение:**
1. Создать отдельные файлы для клиента и сервера:
   ```typescript
   // app/javascript/utils/react_on_rails_client.ts
   import ReactOnRails from "react-on-rails/client";
   export default ReactOnRails;
   
   // app/javascript/utils/react_on_rails_server.ts  
   import ReactOnRails from "react-on-rails";
   export default ReactOnRails;
   ```

2. Обновить импорты в pack-файлах:
   ```bash
   find app/javascript/packs -name "*.js" -exec sed -i '' 's/from "react-on-rails"/from "$app\/utils\/react_on_rails_client"/g' {} \;
   ```

### Проблема: "Cannot read properties of undefined (reading 'register')"
**Симптомы:**
- Ошибка `ReactOnRails.default.register` is undefined
- Компоненты React не регистрируются
- Страницы показывают только навигацию

**Причина:** 
`react-on-rails/client` экспортирует объект по-другому, чем полная версия

**Решение:**
```bash
# Заменить ReactOnRails.default.register на ReactOnRails.register во всех pack-файлах
find app/javascript/packs -name "*.js" -exec sed -i '' 's/ReactOnRails\.default\.register/ReactOnRails.register/g' {} \;
```

**Файлы для проверки:**
- app/javascript/packs/user.js
- app/javascript/packs/signup.js  
- app/javascript/packs/products.js
- app/javascript/packs/analytics.js
- app/javascript/packs/widgets.js
- app/javascript/packs/audience.js
- app/javascript/packs/password.js
- app/javascript/packs/url_redirect_download.js

## 2. Email Configuration - Devise

### Проблема: Письма подтверждения не отправляются
**Симптомы:**
- Кнопка "Надіслати підтвердження повторно" не работает
- Пользователи не получают email при регистрации

**Причины:**
1. SMTP настройки отсутствуют (переменные окружения)
2. Devise использует `deliver_later` (асинхронная отправка через Sidekiq)
3. Sidekiq worker не запущен в development

**Решение для Development:**

1. **Настроить синхронную отправку:**
   ```ruby
   # config/environments/development.rb
   config.action_mailer.delivery_method = :test
   config.action_mailer.perform_deliveries = true
   config.action_mailer.raise_delivery_errors = true
   ```

2. **Создать инициализатор для Devise:**
   ```ruby
   # config/initializers/devise_sync_emails.rb
   if Rails.env.development?
     Rails.application.config.to_prepare do
       User.class_eval do
         def send_devise_notification(notification, *args)
           devise_mailer.send(notification, self, *args).deliver_now
         end
       end
     end
   end
   ```

3. **Для Production:** 
   - Установить переменные окружения `GMAIL_USERNAME` и `GMAIL_APP_PASSWORD`
   - Запустить Sidekiq worker
   - Использовать SMTP delivery method

**Тестирование:**
```ruby
# В Rails console
ActionMailer::Base.deliveries.clear
user = User.create!(email: 'test@example.com', password: 'password123')
user.send_confirmation_instructions
puts ActionMailer::Base.deliveries.count # Должно быть > 0
```

## 3. MetaMask Extension Ошибки

### Проблема: Навязчивые ошибки MetaMask в консоли
**Симптомы:**
- "Failed to connect to MetaMask" ошибки
- "Script error." от chrome-extension
- Красные экраны ошибок в development

**Решение:**

1. **Отключить React Error Overlay:**
   ```javascript
   // config/webpack/development.js
   client: {
     overlay: false  // Полностью отключить error overlay
   }
   ```

2. **Фильтровать ошибки в base_page.ts:**
   ```typescript
   // Переопределить console.error
   const originalConsoleError = console.error;
   console.error = function(...args) {
     const message = args.join(' ');
     if (message.includes('MetaMask') || 
         message.includes('chrome-extension') ||
         message.includes('Script error.') ||
         message.includes('Failed to connect to MetaMask')) {
       return; // Игнорировать ошибки MetaMask/расширений
     }
     originalConsoleError.apply(console, args);
   };
   
   // Блокировать window.ethereum
   Object.defineProperty(window, 'ethereum', {
     value: undefined,
     writable: false,
     configurable: false
   });
   ```

## 4. Database Schema Issues

### Проблема: Отсутствующие таблицы при миграции с Supabase
**Симптомы:**
- "Table doesn't exist" ошибки
- Неполная схема БД

**Решение:**
```ruby
# Создание недостающих таблиц через Rails runner
DISABLE_SPRING=1 bundle exec rails runner "
ActiveRecord::Migration.create_table :table_name do |t|
  # столбцы таблицы
end
"
```

## 5. Webpack Dev Server Issues

### Проблема: "address already in use ::1:3035"
**Симптомы:**
- Webpack dev server не запускается
- Порт 3035 занят

**Решение:**
```bash
# Убить процессы на порту 3035
lsof -ti:3035 | xargs kill -9

# Очистить кеш webpack
rm -rf tmp/cache/shakapacker

# Перезапустить dev server
bin/shakapacker-dev-server
```

## 6. Быстрые Команды для Диагностики

```bash
# Проверить статус серверов
curl -s -o /dev/null -w "%{http_code}" http://localhost:3000/
curl -s -o /dev/null -w "%{http_code}" http://localhost:3035/

# Проверить компиляцию webpack
grep -i error tmp/shakapacker-dev-server.log

# Проверить Rails логи
tail -f log/development.log

# Тест подключения к БД
DISABLE_SPRING=1 bundle exec rails runner "puts User.count"

# Очистка всего кеша
rm -rf tmp/cache/
```

## 7. Переменные Окружения

Критические переменные для работы приложения:

```bash
# Email (для production)
GMAIL_USERNAME=your-email@gmail.com
GMAIL_APP_PASSWORD=your-app-password

# Devise
DEVISE_SECRET_KEY=generated-secret-key

# Database (если не используется database.yml)
DATABASE_URL=postgresql://...

# AWS (для файлов)
AWS_ACCESS_KEY_ID=
AWS_SECRET_ACCESS_KEY=
```

## 8. Порядок Запуска в Development

1. Запустить Redis: `redis-server`
2. Запустить Rails: `bundle exec rails server -p 3000`
3. Запустить Webpack: `bin/shakapacker-dev-server`
4. (Опционально) Sidekiq: `bundle exec sidekiq`

---

*Последнее обновление: 2025-08-29*