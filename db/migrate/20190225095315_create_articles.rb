class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :contnet
      t.integer :status

      t.timestamps
    end
  end
end
