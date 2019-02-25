require 'database_cleaner'

if Rails.env.development?
  DatabaseCleaner.strategy = :truncation
  DatabaseCleaner.clean
  require Rails.root.join("db/seeds_basic").to_s
  require Rails.root.join("db/seeds_dev").to_s
end
