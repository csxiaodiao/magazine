class RemoveResourceIdToArticles < ActiveRecord::Migration[5.2]
  def change
    remove_column :articles, :resource_id, :integer
  end
end
