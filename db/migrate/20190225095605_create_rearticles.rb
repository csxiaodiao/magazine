class CreateRearticles < ActiveRecord::Migration[5.2]
  def change
    create_table :rearticles do |t|
      t.references :articles
      t.string :title
      t.text :contnet

      t.timestamps
    end
  end
end
