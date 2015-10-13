class AddTableQuestionsToGame < ActiveRecord::Migration
  def change
    add_column :games, :table_questions, :text
  end
end
