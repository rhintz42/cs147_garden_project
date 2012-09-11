class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name_first
      t.string :name_middle
      t.string :name_last
      t.string :password_digest
      t.string :username
      t.string :email
      t.integer :salt
      t.integer :authorization
      t.timestamps
    end
  end
end
