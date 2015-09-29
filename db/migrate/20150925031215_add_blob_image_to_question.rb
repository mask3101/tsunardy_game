class AddBlobImageToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :data, :binary
  end
end
