class Admin::ArticlesController < Admin::BaseController
  before_action :set_article, only: [:edit, :update, :show, :destroy, :reedit, :push_art_to_six, :push_art_to_wp]

  def index
    @q = current_account.articles.ransack(params[:q])
    @articles = @q.result.page(params[:page])
  end

  def new
    @article = article_chain.new
  end

  def show
  end

  def create
    @article = article_chain.new(article_params)

    if @article.save
      redirect_to admin_article_path(@article)
    else
      render :new
    end
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

  def destroy
    if @article.destroy
        flash[:notice] = t(:destroy_success)
    else
        flash[:error] = @article.errors_full_messages_text
    end
    redirect_to action: :index
  end

  def reedit
    unless @article.pending?
      render json: {status: @article.status_text}
      return
    end

    @article = @article.reedit

    render json: {status: @article.status_text}
    
  end




  def push_art_to_six
    begin
      render json: {msg: 'success'} if @article.push_art_to_six
    rescue => e        
      render json: {msg: 'fails', info: e.inspect}
    end

  end

  def push_art_to_wp
    sleep 2
    render json: {msg: 'success'}
  end



  private

  def article_chain
    current_account.articles
  end

  def set_article
    @article = article_chain.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :content, :six_category_id, :wp_category_id, :seo_title, :description, :keywords)
  end


end
