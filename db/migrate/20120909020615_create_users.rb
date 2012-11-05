class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.float   :address_latitude
      t.float   :address_longitude
      t.string  :address_street
      t.string  :address_city
      t.string  :address_state
      t.integer :address_zipcode
      t.integer :authorization
      t.string  :email
      t.boolean :gender
      t.float   :last_login
      t.string  :name_first
      t.string  :name_last
      t.string  :name_middle
      t.string  :password_digest
      t.integer :points
      t.integer :salt
      t.string  :time_zone
      t.string  :username
			t.integer :defaultGardenId

      t.timestamps
    end
  end
end
