class AddColumnsToLessons < ActiveRecord::Migration[5.1]
  def change
    add_column :lessons, :start_date, :datetime
    add_column :lessons, :end_date, :datetime
    add_column :lessons, :end_time, :time
    rename_column :lessons, :time, :start_time
  end
end
