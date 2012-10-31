class CreateGardens < ActiveRecord::Migration
  def change
    create_table :gardens do |t|
      t.string :name
      t.string :city
      t.string :state
      t.float  :latitude
      t.float  :longitude
      t.string :picture_path
      t.string :theme
      
      t.references :user

      t.timestamps
    end
    add_index :gardens, :user_id
  end
end
