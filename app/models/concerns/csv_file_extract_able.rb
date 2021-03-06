module CsvFileExtractAble
  extend ActiveSupport::Concern
    
  module ClassMethods
    def extract_content_to_resources

      records = with_status(:pending)
      
      records.each do |record|
        csv_path = record.name.current_path
        
        csv_text = File.read(csv_path)
        csv = CSV.parse(csv_text, :headers => true)

        contents = csv.map do |row|  
          Resource.new(title: row[0], content: row[1])
        end 

        if contents.size > 0
          result = Resource.import contents
          
          if result.failed_instances.present?
            record.failure_extracted!
          end
          record.successful_extracted!
        end
      end
      true 
    end
  end
    
end