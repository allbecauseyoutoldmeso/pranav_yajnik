class CreateVideos < ActiveRecord::Migration[5.1]
  def up
    create_table :videos do |t|
      t.string :caption
      t.string :you_tube_id
      t.timestamps
    end
  end

  def down
    drop_table :videos
  end
end
