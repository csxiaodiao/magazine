class Admin::MainsController < Admin::BaseController
    def home 
        @resource_count  = Resource.count
        @resource_finished  = Resource.with_status(:finished).count
        @article_count  = Article.count

        @article_six_count = Article.with_six_status(:pushed).count
        @article_wp_count = Article.with_wp_status(:pushed).count

        @medium_count  = Medium.count

        

    end
    
end
