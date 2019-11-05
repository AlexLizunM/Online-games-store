class CreateBucketItems < ActiveRecord::Migration[5.2]
  def change
    create_table :bucket_items do |t|
      t.integer :user_id
      t.integer :game_id
      t.foreign_key :users
      t.foreign_key :games
    end
    add_index :bucket_items, [:user_id, :game_id]
  end
end
