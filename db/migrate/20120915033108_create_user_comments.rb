class CreateUserComments < ActiveRecord::Migration
  def change
    create_table :user_comments do |t|
      t.text :body
      t.integer :commenter_id
      t.string :commenter_username
      t.integer :rating
      t.references :user

      t.timestamps
    end
    add_index :user_comments, :user_id
  end
end
