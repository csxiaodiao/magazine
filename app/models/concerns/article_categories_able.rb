module ArticleCategoriesAble
  extend ActiveSupport::Concern
  
  module ClassMethods
    def categories
      return @categories if @categories
      @categories ||= 
        YAML.load_file File.open(Rails.root.join('config', 'categories.yml'))
    end
  end
  
end