class Admin::SessionsController < Devise::SessionsController
    layout "admin/login"
      
    private
  
    def after_sign_in_path_for(resource)
      admin_root_path
    end
  
    def after_sign_out_path_for(scope)
      new_account_session_path
    end
  end
  