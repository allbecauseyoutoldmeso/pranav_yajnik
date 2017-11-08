class CreateCourses < ActiveRecord::Migration[5.1]
  def up
    create_table :courses do |t|
      t.string :what
      t.string :where
      t.string :day
      t.time :time
      t.text :freetext
      t.timestamps
    end
  end

  def down
    drop_table :courses
  end
end
