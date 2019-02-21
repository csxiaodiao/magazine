Dotenv::Railtie.load

CatAi::Api.configure do |config|
    config.app_id = ENV['APP_ID']
    config.app_key = ENV['APP_KEY']
    config.post_url = ENV['POST_URL']
end