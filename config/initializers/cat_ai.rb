Dotenv::Railtie.load

CatAi::Api.configure do |config|
    config.app_id = ENV['AI_APP_ID']
    config.app_key = ENV['AI_APP_KEY']
    config.post_url = ENV['AI_POST_URL']
end