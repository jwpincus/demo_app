class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.time :external_created_at
      t.integer :user_followers
      t.integer :user_id
      t.text :message
      t.decimal :sentiment
      t.string :user_handle

      t.timestamps
    end
  end
end
