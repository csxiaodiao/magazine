class Resource < ApplicationRecord
  paginates_per 10

  include AASM
  extend Enumerize

  has_one :article

  STATUS_HASH = {pending: 3, finished: 2, fails: 1}

  enumerize :status, in: STATUS_HASH, default: :pending, predicates: true, scope: true, i18n_scope: "activerecord.attributes.resource/status"


  def self.statuses
    STATUS_HASH.with_indifferent_access
  end
  
  aasm :status, column: :status, enum: true do
    state :pending, initial: true
    state :finished
    state :fails

    event :successful_extracted  do
      transitions from: :pending, to: :finished
    end

    event :failure_extracted  do
      transitions from: :pending, to: :fails
    end
  end


  def reedit
    resource_id = "resource_id_#{self.id}"

    data = Rails.cache.read(resource_id)

    if data.blank?
      response = CatAi::Api.reedit(mode=1, self.content)
      data = {code: response.code, content: response.body}
      Rails.cache.write(resource_id, data, expires_in: 5.minutes)
    end

    unless data[:code] == 200
      failure_extracted!
      return self
    end

    ActiveRecord::Base.transaction do
      begin       
        self.create_article!(title: self.title, content: data[:content])
        successful_extracted!
      rescue => e        
        failure_extracted!
        raise ActiveRecord::Rollback
      end
    end

    self
  end

  def self.deduplication    
    
    total_count = 0

    while true
      ids = select("MAX(id) as id, count(*) as count").group(:title).having('count>1').collect(&:id)
      if ids.size == 0
        break;
      end
      where(id: ids).destroy_all
      total_count += ids.size
    end
    total_count
  end
  


end
