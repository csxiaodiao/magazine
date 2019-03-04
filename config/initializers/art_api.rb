Dotenv::Railtie.load

ArtApi::Api.configure do |config|
    config.six_post_url = ENV['SIX_POST_URL']
    config.wp_post_url = ENV['WP_POST_URL']
    config.site_id = ENV['SITE_ID']
    config.api_key = ENV['API_KEY']
    config.authorization = ENV['authorization']
end