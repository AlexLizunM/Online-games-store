class AddColumnsToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :description, :string
  end
end
