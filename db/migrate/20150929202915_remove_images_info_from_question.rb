class RemoveImagesInfoFromQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :image_id, :integer
    remove_column :questions, :data, :binary
    remove_column :questions, :filename, :string
    remove_column :questions, :mime_type, :string
  end
end
