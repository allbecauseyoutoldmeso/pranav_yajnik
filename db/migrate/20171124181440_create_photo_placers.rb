class CreatePhotoPlacers < ActiveRecord::Migration[5.1]

  def up
    create_table :photo_placers do |t|
      t.belongs_to :photo
      t.string :place
    end

    connection = ActiveRecord::Base.connection
    connection.execute("INSERT INTO photo_placers (photo_id, place) VALUES (1, 'home')")
    connection.execute("INSERT INTO photo_placers (photo_id, place) VALUES (2, 'about pranav')")
    connection.execute("INSERT INTO photo_placers (photo_id, place) VALUES (3, 'lessons')")
    connection.execute("INSERT INTO photo_placers (photo_id, place) VALUES (4, 'contact')")
  end

  def down
    drop_table :photo_placers
  end
end
