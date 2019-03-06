module Ckeditor
  class AssetResponse
    def file      
      params[:qqfile] || params[:upload]
    end
  end
end
