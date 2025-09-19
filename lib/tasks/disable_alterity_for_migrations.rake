namespace :db do
  task :migrate_without_alterity do
    # Temporarily disable alterity for migrations
    ENV['ALTERITY_ENABLED'] = 'false'

    # Run migrations
    Rake::Task['db:migrate'].invoke
  end
end
