class CreatePersonalPlants < ActiveRecord::Migration
  def change
    create_table :personal_plants do |t|
      t.float   :birthday
      t.integer :hardiness_zone
      t.string  :name_personalized
      t.float   :rating_ease_care
      t.float   :rating_ease_pruning
      t.float   :rating_ease_watering
      t.integer :rating_num
      t.integer :sun_exposure
      t.float   :watering_frequency

      t.references :user
      t.references :plant
      #t.references :garden

      t.timestamps
    end
    add_index :personal_plants, :user_id
    add_index :personal_plants, :plant_id
    #add_index :personal_plants, :garden_id
  end
end
