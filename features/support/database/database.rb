require 'active_record'
require 'database_cleaner'
require 'factory_girl'

ActiveRecord::Base.establish_connection(
    :adapter => 'sqlite3',
    :database => '../puppies/db/development.sqlite3')


DatabaseCleaner.strategy = :truncation, {:except => %w[puppies users]}

Before do
   DatabaseCleaner.start  if ON_LOCAL
end

After do
    DatabaseCleaner.clean if ON_LOCAL
end