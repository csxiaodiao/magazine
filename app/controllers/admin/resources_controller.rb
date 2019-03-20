class Admin::ResourcesController < Admin::BaseController
  before_action :set_resource, only: [:edit, :update, :show, :destroy, :reedit]

  def index
    @q = Resource.ransack(params[:q])
    @resources = @q.result.page(params[:page])
  end

  def show
  end

  def new
    @resource = Resource.new
  end

  def edit
  end

  def update
    if @resource.update(resource_params)
      redirect_to admin_resource_path(@resource)
    else
      render :edit
    end
  end


  def destroy
    if @resource.destroy
        flash[:notice] = t(:destroy_success)
    else
        flash[:error] = @resource.errors_full_messages_text
    end
    redirect_to action: :index
end

  def reedit

    return render json: {status: "未开放"}

    unless @resource.pending?
      render json: {status: @resource.status_text}
      return
    end

    @resource = @resource.reedit
    render json: {status: @resource.status_text}
    
  end

  def deduplication
    begin       
      total_count = Resource.deduplication
      render json: {msg: 'success', total_count: total_count}
    rescue => e   
      render json: {msg: 'fails', info: e.inspect}
    end
  end



  private

  def set_resource
    @resource = Resource.find(params[:id])
  end

  def resource_params
    params.require(:resource).permit(:title, :content)
  end


    
end
