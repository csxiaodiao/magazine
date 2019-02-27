class CreateResources < ActiveRecord::Migration[5.2]
  def change
    create_table :resources do |t|
      t.string :title
      t.text :content
      t.integer :status
      
      t.timestamps
    end
  end
end
