class AddNumQuestionsAndCategoriesToGame < ActiveRecord::Migration
  def change
    add_column :games, :num_categories, :integer
    add_column :games, :num_questions, :integer
  end
end
