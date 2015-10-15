class RenameImages2ForQuestions < ActiveRecord::Migration
  def change
    rename_column :questions, :image_id2, :quest_imags_id
  end
end
