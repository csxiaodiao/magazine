class Article < ApplicationRecord
  paginates_per 10

  include AASM
  extend Enumerize

  belongs_to :resource

  STATUS_HASH = {pending: 3, finished: 2, fails: 1}

  enumerize :status, in: STATUS_HASH, default: :pending, predicates: true, scope: true, i18n_scope: "activerecord.attributes.article/status"
  
  PUSH_STATUS_HASH = {pushed: 1, waiting: 0}

  enumerize :six_status, in: PUSH_STATUS_HASH, default: :waiting, predicates: true, scope: true, i18n_scope: "activerecord.attributes.article/push_status"
  enumerize :wp_status, in: PUSH_STATUS_HASH, default: :waiting, predicates: true, scope: true, i18n_scope: "activerecord.attributes.article/push_status"


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

  def push_art_to_six
    PinYin.abbr(record.name, false, false)
  end

  def push_art_to_wp
    PinYin.abbr(record.name, false, false)
  end



end
