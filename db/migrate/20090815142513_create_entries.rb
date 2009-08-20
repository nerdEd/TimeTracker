class CreateEntries < ActiveRecord::Migration
  def self.up
    create_table :entries do |t|
      t.integer :user_id
      t.string :project
      t.string :activity
      t.string :description
      t.date :date
      t.float :hours

      t.timestamps
    end
  end

  def self.down
    drop_table :entries
  end
end
