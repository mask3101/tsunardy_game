class RenameCategoriasForQuestion < ActiveRecord::Migration
  def change
    rename_column :questions, :categoria, :category_id
  end
end
