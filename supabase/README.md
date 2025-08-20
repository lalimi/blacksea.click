# Supabase Integration

This directory contains configuration and migration files for integrating with Supabase PostgreSQL database.

## Setup

1. Make sure you have the Supabase CLI installed:
   ```
   npm install -g supabase
   ```

2. Configure your environment variables in `.env.local`:
   ```
   DATABASE_HOST=db.qewjnagvsbnwgamrrrwg.supabase.co
   DATABASE_PORT=5432
   DATABASE_NAME=postgres
   DATABASE_USERNAME=postgres
   DATABASE_PASSWORD=your_password
   DATABASE_SSL=true
   ```

3. To migrate data from your local database to Supabase:
   ```
   bin/db_migrate_to_supabase.sh
   ```

## Database Migrations

Migration files are stored in `supabase/migrations/` directory. These files are automatically applied when running migrations.

To create a new migration:
```
supabase migration new your_migration_name
```

## Configuration

The configuration for Supabase is in `supabase/config.toml`.

## Using with Rails

The Rails application is configured to use Supabase when the appropriate environment variables are set. Update your `.env.local` file with the Supabase connection parameters, and the Rails application will connect to Supabase instead of the local database.