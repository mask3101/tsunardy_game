class CreateGameQuestions < ActiveRecord::Migration
  def change
    create_table :game_questions do |t|
      t.integer :game_id, :question_id
      t.timestamps
    end
  end
end
