class CreateUserMessages < ActiveRecord::Migration
  def change
    create_table :user_messages do |t|
      t.text :body
      t.integer :message_type
      t.integer :sender_id
      t.string :sender_username
      t.string :subject
      
      t.references :user

      t.timestamps
    end
    add_index :user_messages, :user_id
  end
end
