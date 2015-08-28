class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.boolean :q_1_1, :q_1_2, :q_1_3, :q_1_4, :q_1_5, :q_2_1, :q_2_2, :q_2_3, :q_2_4, :q_2_5, :q_3_1, :q_3_2, :q_3_3, :q_3_4, :q_3_5, :q_4_1, :q_4_2, :q_4_3, :q_4_4, :q_4_5, :q_5_1, :q_5_2, :q_5_3, :q_5_4, :q_5_5
      t. integer :p1, :p2
      t.timestamps null: false
    end
  end
end
