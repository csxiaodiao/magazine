class Admin::CsvFilesController < Admin::BaseController
    before_action :set_csv_file, only: [:edit, :update, :show, :destroy]

    def index
        @csv_files = CsvFile.page(params[:page])
    end
    
    def new
        @csv_file = CsvFile.new
    end

    def create
        @csv_file = CsvFile.new(csv_file_params)
  
        if @csv_file.save
          flash[:notice] = t(:operation_success)
          redirect_to admin_csv_files_path
        else
          render :new
        end
    end


    def destroy
        if @csv_file.destroy
            flash[:notice] = t(:destroy_success)
        else
            flash[:error] = @csv_file.errors_full_messages_text
        end
        redirect_to action: :index
    end

    def extract
        render json: CsvFile.extract_content_to_articles
    end

    private

    def set_csv_file
        @csv_file = CsvFile.find(params[:id])
    end

    def csv_file_params
        params.require(:csv_file).permit(:name)
    end



end
