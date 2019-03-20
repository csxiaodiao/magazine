class Article < ApplicationRecord
  paginates_per 10

  include AASM
  extend Enumerize

  # belongs_to :resource
  belongs_to :account

  include ArticleCategoriesAble

  PUSH_STATUS_HASH = {pushed: 1, waiting: 0}

  enumerize :six_status, in: PUSH_STATUS_HASH, default: :waiting, predicates: true, scope: true, i18n_scope: "activerecord.attributes.article/push_status"
  enumerize :wp_status, in: PUSH_STATUS_HASH, default: :waiting, predicates: true, scope: true, i18n_scope: "activerecord.attributes.article/push_status"


  def push_art_to_six

    return true if six_status.pushed?

    response = ArtApi::Api.push_six_art(six_art_params)
    body = JSON.parse response.body
    if response.code == 200 and body["status"].to_i == 200     
      self.update!(six_status: PUSH_STATUS_HASH[:pushed])
    end
    true
  end

  def push_art_to_wp
    PinYin.abbr(record.name, false, false)
  end



  private

  def six_art_params
    filename = PinYin.abbr(title, false, false)
    {
      title: title,
      seo_title: seo_title,
      keywords: keywords,
      description: description,
      filename: filename,
      content: content,
      cat_id: six_category_id,
      release: 0,
    }
  end
  



end
