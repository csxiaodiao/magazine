module Admin::BaseHelper
    
    # 根据路径获取所链接的标题，或目标页面的标题
    def path_title(path=nil)
        hash = {}
        if path
        hash = Rails.application.routes.recognize_path(path)
        end
        hash[:controller] ||= controller_path
        hash[:action] ||= action_name
        I18n.t( "#{hash[:controller].gsub("/", ".")}.#{hash[:action]}.title" )
    end


    def is_active(controller_name, paths)
        'active' if paths.include?(controller_name)
    end

end
