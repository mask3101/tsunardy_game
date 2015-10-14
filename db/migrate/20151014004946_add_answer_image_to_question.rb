class AddAnswerImageToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :image_id2, :integer
  end
end
