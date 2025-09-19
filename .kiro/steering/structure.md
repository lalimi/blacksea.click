# Project Structure & Organization

## Rails Application Structure

### Core Application (`app/`)
```
app/
├── assets/           # Static assets (images, fonts, stylesheets)
├── business/         # Domain business logic
│   ├── payments/     # Payment processing logic
│   ├── sales_tax/    # Tax calculation logic
│   └── card_data_handling/  # Card processing
├── controllers/      # HTTP request handlers
│   ├── api/         # API endpoints
│   ├── admin/       # Admin interface
│   └── concerns/    # Shared controller logic
├── helpers/         # View helper methods
├── javascript/      # Frontend React/TypeScript code
├── jobs/           # Background job classes
├── mailers/        # Email sending logic
├── models/         # Data models and business entities
│   ├── concerns/   # Shared model behavior
│   └── help_center/ # Help system models
├── policies/       # Pundit authorization policies
├── presenters/     # View presentation logic
├── services/       # Service objects for complex operations
├── validators/     # Custom validation classes
└── views/          # ERB templates and partials
```

### Configuration (`config/`)
```
config/
├── environments/   # Environment-specific settings
├── initializers/   # Rails initialization code
├── locales/       # Internationalization files
├── routes/        # Route organization (if split)
├── application.rb # Main application configuration
├── database.yml   # Database configuration
└── routes.rb      # URL routing definitions
```

### Database (`db/`)
```
db/
├── migrate/       # Database migration files
├── seeds/         # Seed data organization
├── schema.rb      # Current database schema
└── seeds.rb       # Database seeding script
```

## Key Architectural Patterns

### Business Logic Organization
- **Business objects** in `app/business/` for complex domain logic
- **Service objects** in `app/services/` for operations
- **Presenters** in `app/presenters/` for view logic
- **Policies** in `app/policies/` for authorization

### Model Organization
- Core entities: `User`, `Product` (as `Link`), `Purchase`, `Payment`
- Country-specific bank accounts (e.g., `UkrainianBankAccount`)
- Integration models for external services
- Concerns for shared behavior

### Controller Organization
- RESTful controllers for main resources
- API controllers in `api/` namespace
- Admin controllers in `admin/` namespace
- Specialized controllers for integrations

### Frontend Organization
```
app/javascript/
├── components/     # React components
├── locales/       # Frontend translations
├── pages/         # Page-level components
├── services/      # API communication
├── types/         # TypeScript type definitions
└── utils/         # Utility functions
```

## File Naming Conventions

### Ruby Files
- Models: `snake_case.rb` (e.g., `user.rb`, `bank_account.rb`)
- Controllers: `plural_snake_case_controller.rb`
- Services: `descriptive_snake_case.rb`
- Jobs: `descriptive_snake_case_job.rb`

### JavaScript/TypeScript Files
- Components: `PascalCase.tsx`
- Utilities: `camelCase.ts`
- Types: `PascalCase.types.ts`

### Database
- Tables: `snake_case` plural (e.g., `users`, `bank_accounts`)
- Columns: `snake_case` (e.g., `first_name`, `created_at`)
- Foreign keys: `model_id` (e.g., `user_id`)

## Testing Structure
```
spec/
├── business/       # Business logic tests
├── controllers/    # Controller tests
├── factories/      # FactoryBot factories
├── models/         # Model tests
├── requests/       # Integration tests
├── services/       # Service object tests
├── support/        # Test helpers and configuration
└── spec_helper.rb  # Test configuration
```

## Ukrainian-Specific Organization
- Localization files in `config/locales/uk/`
- Ukrainian payment integrations in `app/business/payments/`
- Tax calculation logic in `app/business/sales_tax/`
- Country-specific bank account models
- Ukrainian legal compliance in terms and policies