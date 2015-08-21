class Add < ActiveRecord::Migration
  def change
    add_column :questions, :categoria, :integer
  end
end
