class AddSixStatusToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :six_status, :boolean, default: false
    add_column :articles, :wp_status, :boolean, default: false
  end
end
