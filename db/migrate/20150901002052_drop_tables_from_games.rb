class DropTablesFromGames < ActiveRecord::Migration
  def change
    remove_column :games, :q_1_1, :boolean
    remove_column :games, :q_1_2, :boolean
    remove_column :games, :q_1_3, :boolean
    remove_column :games, :q_1_4, :boolean
    remove_column :games, :q_1_5, :boolean
    remove_column :games, :q_2_1, :boolean
    remove_column :games, :q_2_2, :boolean
    remove_column :games, :q_2_3, :boolean
    remove_column :games, :q_2_4, :boolean
    remove_column :games, :q_2_5, :boolean
    remove_column :games, :q_3_1, :boolean
    remove_column :games, :q_3_2, :boolean
    remove_column :games, :q_3_3, :boolean
    remove_column :games, :q_3_4, :boolean
    remove_column :games, :q_3_5, :boolean
    remove_column :games, :q_4_1, :boolean
    remove_column :games, :q_4_2, :boolean
    remove_column :games, :q_4_3, :boolean
    remove_column :games, :q_4_4, :boolean
    remove_column :games, :q_4_5, :boolean
    remove_column :games, :q_5_1, :boolean
    remove_column :games, :q_5_2, :boolean
    remove_column :games, :q_5_3, :boolean
    remove_column :games, :q_5_4, :boolean
    remove_column :games, :q_5_5, :boolean
  end
end
