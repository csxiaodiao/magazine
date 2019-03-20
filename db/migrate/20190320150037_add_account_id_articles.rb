class AddAccountIdArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :account_id, :integer
  end
end
