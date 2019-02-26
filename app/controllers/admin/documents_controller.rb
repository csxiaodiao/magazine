class Admin::DocumentsController < Admin::BaseController
    def index
        @documents = CsvFile.page(params[:page])
    end
    
    def new
        @document = CsvFile.new
    end

    def create
        @document = CsvFile.new(document_params)
  
        if @document.save
          flash[:notice] = t(:operation_success)
          redirect_to admin_document_path(@document)
        else
          render :new
        end
    end


    def destroy
        if @document.destroy
            flash[:notice] = t(:destroy_success)
        else
            flash[:error] = @document.errors_full_messages_text
        end
        redirect_to action: :index
    end
    
    
    private

    def document_params
        params.require(:document).permit(:title, :path)
    end



  




end
