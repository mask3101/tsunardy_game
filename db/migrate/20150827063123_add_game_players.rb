class AddGamePlayers < ActiveRecord::Migration
  def change
    add_column :games, :p1, :integer
    add_column :games, :p2, :integer
  end
end
