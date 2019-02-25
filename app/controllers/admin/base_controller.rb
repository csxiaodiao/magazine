class Admin::BaseController < ApplicationController
    before_action :authenticate_account!

    layout "admin/admin"

    private
  
    def user_not_authorized
      flash[:alert] = "权限不足，请联系管理员"
      redirect_to(request.referrer || root_path)
    end
end