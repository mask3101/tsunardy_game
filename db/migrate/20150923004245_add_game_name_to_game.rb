class AddGameNameToGame < ActiveRecord::Migration
  def change
    add_column :games, :game_name, :text
  end
end
