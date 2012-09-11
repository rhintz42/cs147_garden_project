class CreatePlants < ActiveRecord::Migration
  def up
    create_table :plants do |t|
      t.string :name_common
      t.string :name_botanical
      t.string :plant_type
      t.float :water_weekly
      t.float :water_frequency
      t.integer :recommended_sun_exposure
      t.integer :actual_sun_exposure
      t.boolean :is_houseplant
      t.text :description
      t.boolean :created_from_user
      t.integer :authorization

      t.timestamps
    end
  end

  def down
    drop_table :plants
  end
end
