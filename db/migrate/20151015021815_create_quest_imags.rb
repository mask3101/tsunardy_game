class CreateQuestImags < ActiveRecord::Migration
  def change
    create_table :quest_imags do |t|
      t.binary :data2
      t.string :filename, :mime_type
      t.integer :question_id
      t.timestamps
    end
  end
end
