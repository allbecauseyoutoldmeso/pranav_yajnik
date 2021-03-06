class CreateLessons < ActiveRecord::Migration[5.1]
  def up
    create_table :lessons do |t|
      t.string :what
      t.string :where
      t.integer :day
      t.time :time
      t.text :freetext
      t.timestamps
    end
  end

  def down
    drop_table :lessons
  end
end
