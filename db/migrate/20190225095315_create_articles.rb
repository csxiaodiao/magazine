class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.references :resource
      t.string :title
      t.text :content
      t.integer :status

      t.timestamps
    end
  end
end
