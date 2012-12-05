class CreatePersonalPlantComments < ActiveRecord::Migration
  def change
    create_table :personal_plant_comments do |t|
      t.text :body
      t.string :commenter
      t.integer :days_had_plant
      t.integer :rating
      t.float :rating_ease_care
      t.float :rating_ease_pruning
      t.float :rating_ease_watering

      t.references :user
      t.references :personal_plant

      t.timestamps
    end
    add_index :personal_plant_comments, :user_id
    add_index :personal_plant_comments, :personal_plant_id
  end
end
