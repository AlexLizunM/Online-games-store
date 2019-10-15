class RemoveCoverUrlFromGames < ActiveRecord::Migration[5.2]
  def change
    remove_column(:games, :cover_url)
  end
end
