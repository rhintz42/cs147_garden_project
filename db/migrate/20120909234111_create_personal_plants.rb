class CreatePersonalPlants < ActiveRecord::Migration
  def change
    create_table :personal_plants do |t|
      t.string :name_personalized
      t.integer :actual_sun_exposure
      t.float :watering_frequency
      t.timestamp :last_watering
      t.timestamp :next_watering
      t.references :user
      t.references :plant

      t.timestamps
    end
    add_index :personal_plants, :user_id
    add_index :personal_plants, :plant_id
  end
end
