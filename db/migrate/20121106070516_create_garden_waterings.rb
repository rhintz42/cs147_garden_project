class CreateGardenWaterings < ActiveRecord::Migration
  def change
    create_table :garden_waterings do |t|
      t.float :watering_amount
      t.float :watering_time
      t.references :garden

      t.timestamps
    end
    add_index :garden_waterings, :garden_id
  end
end
