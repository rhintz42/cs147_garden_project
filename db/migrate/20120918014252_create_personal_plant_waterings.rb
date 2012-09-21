class CreatePersonalPlantWaterings < ActiveRecord::Migration
  def change
    create_table :personal_plant_waterings do |t|
      t.float :watering_amount
      t.float :watering_time

      t.references :personal_plant

      t.timestamps
    end
    add_index :personal_plant_waterings, :personal_plant_id
  end
end
