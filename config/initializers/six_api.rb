Dotenv::Railtie.load

SixApi::Api.configure do |config|
    config.site_id = ENV['SIX_SITE_ID']
    config.api_key = ENV['SIX_APP_KEY']
    config.post_url = ENV['SIX_POST_URL']
end