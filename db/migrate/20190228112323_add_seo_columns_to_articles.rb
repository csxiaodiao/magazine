class AddSeoColumnsToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :seo_title, :string
    add_column :articles, :keywords, :string
    add_column :articles, :description, :string
  end
end
