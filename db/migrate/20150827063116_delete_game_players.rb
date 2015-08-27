class DeleteGamePlayers < ActiveRecord::Migration
  def change
    remove_column :games, :p1, :boolean
    remove_column :games, :p2, :boolean
  end
end
