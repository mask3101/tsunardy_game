class AddNumPlayersToGames < ActiveRecord::Migration
  def change
    add_column :games, :num_players, :integer
  end
end
