class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :question, :answer
      t.integer :difficulty, :points
      t.boolean :active_question
      t.timestamps null: false
    end
  end
end
