class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.binary :data
      t.string :filename, :mime_type
      t.integer :question_id
      t.timestamps
    end
  end
end
