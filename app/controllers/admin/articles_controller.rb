class Admin::ArticlesController < Admin::BaseController
  before_action :set_article, only: [:edit, :update, :show, :destroy, :reedit]

  def index
    @articles = Article.page(params[:page])
  end

  def show
  end

  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to admin_article_path(@article)
    else
      render :edit
    end
  end

  def reedit 
    
    unless @article.pending?
      render json: {status: @article.status_text}
      return
    end

    @article = @article.reedit

    render json: {status: @article.status_text}
    
  end



  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :content)
  end


end
