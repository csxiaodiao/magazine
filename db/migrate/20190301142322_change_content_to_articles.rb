class ChangeContentToArticles < ActiveRecord::Migration[5.2]
  def change
    remove_column :resources, :content, :text
    add_column :resources, :content, :text, limit: 4294967295
  end
end
