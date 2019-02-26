class Admin::ArticlesController < Admin::BaseController
  before_action :set_article, only: [:edit, :update, :show, :destroy]


  def index
    @articles = Article.page(params[:page])
  end

  def show
  end


  private

  def set_article
    @article = Article.find(params[:id])
  end


end
