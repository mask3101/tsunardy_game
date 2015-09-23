class AddTableValuesForGame < ActiveRecord::Migration
  def change
    add_column :games, :table_values, :text
  end
end
