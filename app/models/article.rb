class Article < ApplicationRecord
  paginates_per 10

  include AASM
  extend Enumerize

  belongs_to :resource
  
  include ArticleCategoriesAble

  
  


  PUSH_STATUS_HASH = {pushed: 1, waiting: 0}

  enumerize :six_status, in: PUSH_STATUS_HASH, default: :waiting, predicates: true, scope: true, i18n_scope: "activerecord.attributes.article/push_status"
  enumerize :wp_status, in: PUSH_STATUS_HASH, default: :waiting, predicates: true, scope: true, i18n_scope: "activerecord.attributes.article/push_status"


  def push_art_to_six
    PinYin.abbr(record.name, false, false)
  end

  def push_art_to_wp
    PinYin.abbr(record.name, false, false)
  end

end
