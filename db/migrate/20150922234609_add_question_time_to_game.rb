class AddQuestionTimeToGame < ActiveRecord::Migration
  def change
    add_column :games, :tiempo, :integer
  end
end
