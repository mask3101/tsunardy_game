class AddColumnsToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :filename, :string
    add_column :questions, :mime_type, :string
    add_column :questions, :data, :binary
  end
end
