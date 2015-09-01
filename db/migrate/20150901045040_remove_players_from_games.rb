class RemovePlayersFromGames < ActiveRecord::Migration
  def change
    remove_column :games, :p1, :integer
    remove_column :games, :p2, :integer
  end
end
