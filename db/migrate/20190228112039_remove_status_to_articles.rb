class RemoveStatusToArticles < ActiveRecord::Migration[5.2]
  def change
    remove_column :articles, :status, :integer
  end
end
