# BlackSea Platform - Production Deployment Guide

## 🌊 Описание
Этот документ содержит инструкции по развертыванию платформы BlackSea в production окружении.

## 📋 Предварительные требования

### Системные зависимости
- Ubuntu 20.04+ или Debian 11+
- Ruby 3.4.3
- Node.js 20.17.0+
- PostgreSQL 15+
- Redis 7.0+
- Nginx
- SSL сертификаты (Let's Encrypt)

### Необходимые сервисы
- **VPS/Dedicated Server** (минимум 2GB RAM, 1 CPU)
- **Domain name**: blacksea.click (уже зарегистрирован)
- **SSL сертификат**: Let's Encrypt
- **Email сервис**: Resend или аналог
- **File storage**: AWS S3 или Cloudflare R2
- **Payment processors**: Stripe, LiqPay, Fondy, Monobank

## 🚀 Быстрый деплой

### 1. Подготовка сервера

```bash
# Обновление системы
sudo apt update && sudo apt upgrade -y

# Установка базовых зависимостей
sudo apt install -y curl wget gnupg2 software-properties-common

# Установка Ruby
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/HEAD/bin/rbenv-installer | bash
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
source ~/.bashrc
rbenv install 3.4.3
rbenv global 3.4.3

# Установка Node.js
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt install -y nodejs

# Установка PostgreSQL
sudo apt install -y postgresql postgresql-contrib

# Установка Redis
sudo apt install -y redis-server

# Установка Nginx
sudo apt install -y nginx

# Установка certbot для SSL
sudo apt install -y certbot python3-certbot-nginx
```

### 2. Настройка базы данных

```bash
# Создание пользователя базы данных
sudo -u postgres createuser --createdb --superuser $USER

# Создание базы данных для production
createdb blacksea_production
```

### 3. Клонирование и настройка приложения

```bash
# Клонирование репозитория
git clone <repository-url> blacksea
cd blacksea

# Установка Ruby зависимостей
gem install bundler
bundle config set --local without 'development test'
bundle install

# Установка Node.js зависимостей
npm install

# Настройка переменных окружения
cp .env.production.example .env.production
nano .env.production  # Отредактируйте с реальными значениями
```

### 4. Настройка SSL сертификатов

```bash
# Запуск скрипта настройки SSL
sudo ./script/setup_ssl.sh
```

### 5. Деплой приложения

```bash
# Запуск скрипта деплоя (теперь поддерживает запуск под root)
sudo ./script/deploy.sh
```

**Примечание:** Скрипт деплоя теперь поддерживает запуск под root'ом, но рекомендует использовать выделенного пользователя для безопасности. При запуске под root будет показано предупреждение, но деплой продолжится.

### 6. Обновление существующего развертывания

Для обновления уже развернутого приложения без полной переустановки используйте скрипт обновления:

```bash
# Обновление приложения (быстрое, без удаления данных)
sudo ./script/update.sh

# Или с помощью --help для справки
sudo ./script/update.sh --help
```

**Что делает скрипт обновления:**
- ✅ Скачивает последние изменения из Git
- ✅ Обновляет Ruby и Node.js зависимости
- ✅ Выполняет миграции базы данных (если есть)
- ✅ Перекомпилирует ассеты
- ✅ Перезапускает сервисы с минимальным простоем
- ✅ Проверяет работоспособность после обновления
- ✅ Автоматический откат при ошибках

**Преимущества обновления:**
- 🚀 Минимум простоя (обычно < 30 секунд)
- 💾 Сохраняются все данные и настройки
- 🔄 Автоматический откат при проблемах
- ⚡ Быстрее полного деплоя

## 🔧 Ручная настройка (если скрипт не работает)

### Настройка Nginx

```bash
# Копирование конфигурации
sudo cp config/nginx.production.conf /etc/nginx/sites-available/blacksea

# Включение сайта
sudo ln -s /etc/nginx/sites-available/blacksea /etc/nginx/sites-enabled/

# Удаление дефолтного сайта
sudo rm /etc/nginx/sites-enabled/default

# Проверка конфигурации
sudo nginx -t

# Перезапуск Nginx
sudo systemctl reload nginx
```

### Настройка systemd сервисов

```bash
# Создание сервиса для Puma
sudo tee /etc/systemd/system/blacksea-puma.service > /dev/null <<EOF
[Unit]
Description=BlackSea Puma Server
After=network.target

[Service]
Type=simple
User=$USER
WorkingDirectory=/var/www/blacksea
Environment=RAILS_ENV=production
Environment=PORT=3000
ExecStart=/home/$USER/.rbenv/shims/bundle exec puma -C config/puma.rb
Restart=always

[Install]
WantedBy=multi-user.target
EOF

# Создание сервиса для Sidekiq
sudo tee /etc/systemd/system/blacksea-sidekiq.service > /dev/null <<EOF
[Unit]
Description=BlackSea Sidekiq
After=network.target redis-server.service

[Service]
Type=simple
User=$USER
WorkingDirectory=/var/www/blacksea
Environment=RAILS_ENV=production
ExecStart=/home/$USER/.rbenv/shims/bundle exec sidekiq
Restart=always

[Install]
WantedBy=multi-user.target
EOF

# Перезагрузка systemd и запуск сервисов
sudo systemctl daemon-reload
sudo systemctl enable blacksea-puma blacksea-sidekiq
sudo systemctl start blacksea-puma blacksea-sidekiq
```

## 🔐 Переменные окружения

### Обязательные переменные

```bash
# Rails
RAILS_ENV=production
RAILS_MASTER_KEY=your-production-master-key
SECRET_KEY_BASE=your-production-secret-key
DEVISE_SECRET_KEY=your-production-devise-key

# Deployment (опционально, по умолчанию www-data при запуске под root)
DEPLOY_USER=www-data

# Domain
DOMAIN=blacksea.click
PROTOCOL=https
ASSET_DOMAIN=cdn.blacksea.click

# Database
DATABASE_URL=postgresql://user:password@localhost/blacksea_production

# Redis
REDIS_URL=redis://localhost:6379/0
SIDEKIQ_REDIS_HOST=redis://localhost:6379/1

# Email
RESEND_API_KEY=your-resend-api-key

# Payments
STRIPE_API_KEY=your-stripe-api-key
LIQPAY_PUBLIC_KEY=your-liqpay-public-key
LIQPAY_PRIVATE_KEY=your-liqpay-private-key

# File Storage
AWS_ACCESS_KEY_ID=your-aws-key
AWS_SECRET_ACCESS_KEY=your-aws-secret
AWS_DEFAULT_REGION=us-east-1
```

## 📊 Мониторинг

### Настройка логирования

```bash
# Просмотр логов приложения
sudo journalctl -u blacksea-puma -f

# Просмотр логов Sidekiq
sudo journalctl -u blacksea-sidekiq -f

# Просмотр логов Nginx
sudo tail -f /var/log/nginx/blacksea.access.log
sudo tail -f /var/log/nginx/blacksea.error.log
```

### Health checks

```bash
# Проверка статуса сервисов
sudo systemctl status blacksea-puma
sudo systemctl status blacksea-sidekiq
sudo systemctl status nginx

# Проверка приложения
curl -f https://blacksea.click/health

# Проверка базы данных
cd /var/www/blacksea
RAILS_ENV=production bundle exec rails db:version
```

## 🔄 Обновление приложения

### Быстрое обновление (рекомендуется)

```bash
# Используйте скрипт обновления для быстрого развертывания
sudo ./script/update.sh
```

### Ручное обновление

Если нужно выполнить обновление вручную:

```bash
# На сервере
cd /var/www/blacksea
git pull origin main

# Установка зависимостей
bundle install
npm install

# Миграции базы данных
RAILS_ENV=production bundle exec rake db:migrate

# Перекомпиляция ассетов
RAILS_ENV=production bundle exec rake assets:precompile

# Перезапуск сервисов
sudo systemctl restart blacksea-puma
sudo systemctl restart blacksea-sidekiq
```

**Рекомендация:** Используйте `sudo ./script/update.sh` для автоматического обновления с проверками и откатом при ошибках.

## 🚨 Troubleshooting

### Распространенные проблемы

1. **Приложение не запускается**
   ```bash
   # Проверить логи Puma
   sudo journalctl -u blacksea-puma -n 50

   # Проверить переменные окружения
   cd /var/www/blacksea && cat .env.production
   ```

2. **База данных недоступна**
   ```bash
   # Проверить подключение к PostgreSQL
   psql -d blacksea_production -c "SELECT version();"

   # Проверить переменную DATABASE_URL
   cd /var/www/blacksea && bundle exec rails runner "puts ENV['DATABASE_URL']"
   ```

3. **Статические файлы не загружаются**
   ```bash
   # Проверить права доступа
   ls -la /var/www/blacksea/public/assets/

   # Проверить конфигурацию Nginx
   sudo nginx -t
   ```

## 📞 Поддержка

При возникновении проблем:
1. Проверьте логи сервисов
2. Убедитесь, что все переменные окружения настроены
3. Проверьте подключение к внешним сервисам
4. Свяжитесь с командой разработки

## ✅ Checklist деплоя

- [ ] Сервер подготовлен (Ruby, Node.js, PostgreSQL, Redis, Nginx)
- [ ] Репозиторий клонирован
- [ ] Переменные окружения настроены
- [ ] SSL сертификаты установлены
- [ ] Приложение развернуто
- [ ] Сервисы запущены и работают
- [ ] Health checks проходят
- [ ] Domain настроен и доступен
- [ ] Мониторинг настроен