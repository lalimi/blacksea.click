# Technology Stack & Development

## Backend Stack
- **Framework**: Ruby on Rails 7.1.3.4
- **Language**: Ruby 3.4.3 (see `.ruby-version`)
- **Database**: PostgreSQL 15+ (Supabase hosted)
- **Cache/Queue**: Redis 7.0
- **Search**: Elasticsearch 7.9.3
- **Background Jobs**: Sidekiq + Redis
- **WebSockets**: AnyCable for real-time features
- **Authentication**: Devise with Ukrainian localization
- **Authorization**: Pundit policies
- **File Storage**: ActiveStorage + AWS S3/Cloudflare R2

## Frontend Stack
- **JavaScript**: Modern ES6+ with TypeScript support
- **Build Tool**: Shakapacker (Rails 7 asset pipeline)
- **CSS Framework**: Tailwind CSS 3.4+
- **UI Library**: React 18.1+ with custom components
- **Internationalization**: i18next with Ukrainian primary locale
- **State Management**: React hooks + context

## Development Tools
- **Code Quality**: RuboCop (Ruby), ESLint (JavaScript/TypeScript)
- **Testing**: RSpec (Ruby), Capybara (integration)
- **Process Manager**: Foreman (via Procfile.dev)
- **Containerization**: Docker + Docker Compose
- **Package Managers**: Bundler (Ruby), npm (Node.js)

## Common Commands

### Development Setup
```bash
# Install dependencies
bundle install
npm install

# Database setup
bin/rails db:prepare

# Start development servers
bin/dev  # Starts all services via Foreman
```

### Development Workflow
```bash
# Rails console
bin/rails c

# Run tests
bin/rspec
bin/rspec spec/models/user_spec.rb  # specific file

# Code linting
rubocop
npm run lint-fast

# Asset compilation
npm run build
npm run watch  # development mode
```

### Database Operations
```bash
# Create migration
bin/rails g migration AddFieldToTable

# Run migrations
bin/rails db:migrate

# Reset database
bin/rails db:reset
```

### Background Jobs
```bash
# Start Sidekiq
bundle exec sidekiq

# Monitor jobs
# Visit /sidekiq in development
```

## Environment Configuration
- **Development**: Uses `.env.development` and `.env.local`
- **Default locale**: Ukrainian (`uk`)
- **Default currency**: UAH
- **Database**: Supabase PostgreSQL with fallback to local
- **Redis**: Local instance for development