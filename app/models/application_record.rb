class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def errors_full_messages_text
    errors.full_messages.join('，')
  end
end
