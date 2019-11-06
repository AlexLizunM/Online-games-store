class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :content
      t.integer :rating
      t.references :user, foreign_key: true
      t.references :game, foreign_key: true
    end
    add_index :comments, [:user_id, :game_id], unique: true
  end
end
