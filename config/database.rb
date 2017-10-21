configure :test do
  set :database, {
    adapter: 'postgresql',
    encoding: 'utf8',
    database: 'faq_bot_test',
    pool: 5,
    username: 'postgres',
    host: 'postgres'
  }
end

configure :development do
  set :database, {
    adapter: 'postgresql',
    encoding: 'utf8',
    database: 'faq_bot_development',
    pool: 5,
    username: 'postgres',
    host: 'postgres'
  }
end

configure :production do
  set :database, {
    adapter: 'postgresql',
    encoding: 'utf8',
    database: 'faq_bot_production',
    pool: 5,
    username: 'postgres',
    host: 'postgres'
  }
end