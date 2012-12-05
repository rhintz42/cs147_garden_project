class CreatePlantComments < ActiveRecord::Migration
  def change
    create_table :plant_comments do |t|
      t.text :body
      t.string :commenter
      t.integer :rating

      
      t.references :plant
      t.references :user

      t.timestamps
    end
    add_index :plant_comments, :user_id
    add_index :plant_comments, :plant_id
  end
end
