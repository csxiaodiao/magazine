class AddSixCategoryIdArticles < ActiveRecord::Migration[5.2]
  def change
    remove_column :articles, :category_id, :integer
    add_column :articles, :six_category_id, :integer
    add_column :articles, :wp_category_id, :integer
  end
end
