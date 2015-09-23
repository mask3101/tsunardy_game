class CreateGameCategories < ActiveRecord::Migration
  def change
    create_table :game_categories do |t|
      t.integer :game_id, :category_id
      t.timestamps
    end
  end
end
