class CreatePlants < ActiveRecord::Migration
  def up
    create_table :plants do |t|
      t.boolean :authorized
      t.text    :description
      t.integer :hardiness_zone_max
      t.integer :hardiness_zone_min
      t.boolean :is_houseplant
      t.float   :leeway_sun_exposure
      t.float   :leeway_watering_weekly_amount
      t.string  :name_botanical
      t.string  :name_common
      t.string  :plant_type
      t.float   :rating_ease_care
      t.float   :rating_ease_pruning
      t.float   :rating_ease_watering
      t.integer :rating_num
      t.integer :sun_exposure
      t.integer :user_created_by
      t.float   :watering_frequency_old
      t.float   :watering_frequency_new
      t.float   :watering_weekly_amount
      
      t.timestamps
    end
  end

  def down
    drop_table :plants
  end
end
