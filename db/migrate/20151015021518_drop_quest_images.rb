class DropQuestImages < ActiveRecord::Migration
  def up
    drop_table :quest_imags
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
