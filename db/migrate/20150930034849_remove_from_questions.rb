class RemoveFromQuestions < ActiveRecord::Migration
  def change
    remove_column :questions, :data, :binary
    remove_column :questions, :filename, :string
    remove_column :questions, :mime_type, :string
  end
end
