# idea.md

```markdown
# BlackSea Platform — Полный технический контекст для ИИ

## Что это за проект

BlackSea — украинская платформа для продажи цифровых товаров, полная локальная альтернатива Gumroad. Главная цель: решить проблемы украинских создателей с валютным законодательством, налогообложением и отсутствием локализации на зарубежных платформах.

## Полная техническая архитектура

### Backend Stack
- **Framework**: Ruby on Rails 7.0+
- **Database**: PostgreSQL 15+ (через Supabase)
- **Authentication**: Devise gem
- **File Storage**: Active Storage с AWS S3 / Cloudflare R2
- **Background Jobs**: Sidekiq + Redis
- **API**: RESTful API + GraphQL (возможно)
- **Search**: Elasticsearch или pg_search
- **Caching**: Redis для кеширования

### Frontend Stack
- **Core**: Modern Vanilla JavaScript (ES6+)
- **CSS Framework**: Tailwind CSS 3.0+
- **Build Tool**: esbuild (встроенный в Rails 7)
- **PWA**: Service Workers для офлайн функциональности
- **Forms**: Stimulus (Hotwire) для интерактивности
- **Design System**: Собственная библиотека компонентов

### Платежные интеграции
- **LiqPay API** (ПриватБанк) — основной провайдер
- **Fondy API** — альтернативный провайдер
- **WayForPay API** — дополнительный провайдер
- **Monobank API** — для переводов P2P
- **SWIFT-переводы** — для корпоративных клиентов

### Инфраструктура
- **Hosting**: Hetzner (Германия) или OVH (Франция)
- **CDN**: Cloudflare
- **Monitoring**: New Relic / Sentry
- **CI/CD**: GitHub Actions
- **SSL**: Let's Encrypt через Cloudflare

## Детальная локализация

### Многоязычность
```
# config/locales/ структура
- uk.yml          # Украинский (основной)
- ru.yml          # Русский (дополнительный)
- en.yml          # Английский (для API документации)

# I18n конфигурация
config.i18n.default_locale = :uk
config.i18n.fallbacks = [:uk, :ru, :en]
```

### Украинские особенности в коде
```
# app/models/concerns/ukrainian_formatting.rb
module UkrainianFormatting
  def format_currency(amount)
    "#{amount.to_f} ₴"
  end
  
  def format_phone(phone)
    # +380 XX XXX XX XX формат
  end
  
  def transliterate_filename(filename)
    # Транслитерация украинских символов для файлов
  end
end

# Украинские налоговые расчеты
class TaxCalculator
  def calculate_fop_tax(amount, group = 3)
    # Расчет налога для ФОП 3 группы (5% + военный сбор 1.5%)
    base_tax = amount * 0.05
    war_tax = amount * 0.015
    base_tax + war_tax
  end
end
```

### Локализованные компоненты UI
```
// app/javascript/controllers/ukrainian_date_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    // Украинские названия месяцев и дней недели
    this.monthNames = [
      "Січень", "Лютий", "Березень", "Квітень", "Травень", "Червень",
      "Липень", "Серпень", "Вересень", "Жовтень", "Листопад", "Грудень"
    ]
  }
}
```

### Валютное законодательство в коде
```
# app/services/currency_compliance_service.rb
class CurrencyComplianceService
  # Проверка соответствия валютному законодательству НБУ
  def validate_foreign_transaction(amount_usd)
    # Лимит $150,000 в год для ФОП без валютной лицензии
    annual_limit = 150_000
    current_year_total = calculate_annual_foreign_income
    
    (current_year_total + amount_usd) <= annual_limit
  end
  
  def generate_currency_report
    # Генерация отчетности для НБУ
  end
end
```

## Специфичные украинские модели данных

### User Model с украинскими полями
```
class User < ApplicationRecord
  # Украинские идентификаторы
  validates :inn, presence: true, length: { is: 10 } # ИНН физлица
  validates :phone, format: { with: /\A\+380\d{9}\z/ } # Украинский формат
  
  enum tax_group: { 
    group_1: 1,    # ФОП 1 группа
    group_2: 2,    # ФОП 2 группа  
    group_3: 3,    # ФОП 3 группа (основная для IT)
    legal_entity: 4 # Юридическое лицо
  }
  
  # Банковские реквизиты
  has_many :bank_accounts, dependent: :destroy
end

class BankAccount < ApplicationRecord
  validates :iban, presence: true, format: { with: /\AUA\d{27}\z/ }
  validates :mfo, presence: true, length: { is: 6 } # МФО банка
  validates :edrpou, length: { is: 8 } # ЕГРПОУ банка
end
```

### Product Model с украинской спецификой
```
class Product < ApplicationRecord
  # Украинские категории товаров
  enum category: {
    software: 'ПО та додатки',
    design: 'Дизайн та графіка', 
    education: 'Навчання та курси',
    music: 'Музика та аудіо',
    ebooks: 'Електронні книги',
    templates: 'Шаблони та макети'
  }
  
  # Поддержка украинских тегов
  validates :tags, presence: true
  before_save :transliterate_slug
  
  def price_in_uah
    # Конвертация в гривны если цена в USD
    price * current_usd_rate
  end
end
```

## Интеграция с украинскими сервисами

### API для банков
```
# app/services/privat_bank_service.rb
class PrivatBankService
  BASE_URL = 'https://api.privatbank.ua/p24api'
  
  def get_exchange_rates
    # Получение курса валют от ПриватБанка
    response = HTTParty.get("#{BASE_URL}/pubinfo?json&exchange&coursid=5")
    parse_rates(response)
  end
  
  def create_liqpay_payment(order)
    # Интеграция с LiqPay
    liqpay = LiqPay.new(public_key, private_key)
    liqpay.cnb_form({
      'action' => 'pay',
      'amount' => order.amount,
      'currency' => 'UAH',
      'description' => order.description,
      'order_id' => order.id
    })
  end
end
```

### Налоговая интеграция
```
# app/services/tax_service.rb
class TaxService
  def generate_fop_invoice(sale)
    # Генерация накладной для ФОП
    {
      invoice_number: generate_invoice_number,
      date: sale.created_at.strftime('%d.%m.%Y'),
      seller_inn: sale.seller.inn,
      buyer_info: sale.buyer.ukrainian_details,
      amount: sale.amount,
      tax_amount: calculate_tax(sale.amount),
      description: sale.product.title_uk
    }
  end
end
```

## Специфичная для Украины валидация

### Форматы данных
```
# app/validators/
class UkrainianPhoneValidator < ActiveModel::Validator
  def validate(record)
    unless record.phone =~ /\A\+380[0-9]{9}\z/
      record.errors.add :phone, 'має бути у форматі +380XXXXXXXXX'
    end
  end
end

class InnValidator < ActiveModel::Validator
  def validate(record)
    # Проверка контрольной суммы украинского ИНН
    unless valid_ukrainian_inn?(record.inn)
      record.errors.add :inn, 'невірний формат ІПН'
    end
  end
end
```

## Локализация UI компонентов

### Украинские форматы дат и чисел
```
// app/assets/stylesheets/ukrainian.scss
.currency-uah::after {
  content: " ₴";
  font-weight: bold;
}

.phone-ua::before {
  content: "+380";
  color: #0066cc;
}

// Украинские цвета флага для акцентов
:root {
  --ukraine-blue: #0057b7;
  --ukraine-yellow: #ffd700;
  --ukraine-primary: var(--ukraine-blue);
  --ukraine-accent: var(--ukraine-yellow);
}
```

### JavaScript локализация
```
// app/javascript/locales/uk.js
export const uk = {
  currency: {
    symbol: '₴',
    format: '%amount% %symbol%'
  },
  
  dates: {
    months: [
      'січня', 'лютого', 'березня', 'квітня', 'травня', 'червня',
      'липня', 'серпня', 'вересня', 'жовтня', 'листопада', 'грудня'
    ],
    weekdays: ['нд', 'пн', 'вт', 'ср', 'чт', 'пт', 'сб']
  },
  
  fileTypes: {
    pdf: 'ПДФ файл',
    zip: 'Архів',
    mp3: 'Аудіо файл'
  }
}
```

## База данных схема с украинской спецификой

### Миграции для украинских полей
```
# db/migrate/xxx_add_ukrainian_fields_to_users.rb
class AddUkrainianFieldsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :inn, :string, limit: 10
    add_column :users, :passport_series, :string, limit: 2
    add_column :users, :passport_number, :string, limit: 6
    add_column :users, :tax_group, :integer, default: 3
    add_column :users, :region, :string # Область України
    add_column :users, :city, :string
    
    add_index :users, :inn, unique: true
  end
end
```

## Конфигурация для украинского рынка

### Application.rb настройки
```
# config/application.rb
class Application < Rails::Application
  # Украинская временная зона
  config.time_zone = 'Kyiv'
  
  # Украинская локаль по умолчанию
  config.i18n.default_locale = :uk
  config.i18n.available_locales = [:uk, :ru, :en]
  
  # Украинская валюта по умолчанию
  config.default_currency = 'UAH'
  
  # Поддержка кириллицы в URL
  config.force_ssl = true
end
```

### Seeds для украинских данных
```
# db/seeds.rb
# Украинские банки
Bank.create!([
  { name: 'ПриватБанк', mfo: '305299', swift: 'PBANUA2X' },
  { name: 'Монобанк', mfo: '305299', swift: 'PBANUA2X' },
  { name: 'ОщадБанк', mfo: '300012', swift: 'OSCHCHUA' }
])

# Украинские регионы
Region.create!([
  { name: 'Київська область', code: 'KV' },
  { name: 'Львівська область', code: 'LV' },
  { name: 'Харківська область', code: 'KH' }
])
```

## Тестирование украинской специфики

### RSpec примеры
```
# spec/models/user_spec.rb
RSpec.describe User do
  describe 'ukrainian validations' do
    it 'validates ukrainian phone format' do
      user = build(:user, phone: '+380501234567')
      expect(user).to be_valid
      
      user.phone = '+1234567890'
      expect(user).not_to be_valid
    end
    
    it 'validates INN format' do
      user = build(:user, inn: '1234567890')
      expect(user).to be_valid
    end
  end
end
```

## API документация на украинском

### OpenAPI спецификация
```
# swagger/api_uk.yml
openapi: 3.0.0
info:
  title: BlackSea API
  description: API для української платформи цифрових продуктів
  version: 1.0.0

paths:
  /api/v1/products:
    get:
      summary: Отримати список товарів
      parameters:
        - name: category
          in: query
          description: Категорія товару українською
```

---

*Цей файл містить повний технічний контекст проекту BlackSea для ефективної роботи ІІ-асистентів з врахуванням усіх українських особливостей*
```

