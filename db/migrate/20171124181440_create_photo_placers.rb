class CreatePhotoPlacers < ActiveRecord::Migration[5.1]

  def up
    create_table :photo_placers do |t|
      t.belongs_to :photo
      t.string :place
      t.string :url
    end

    connection = ActiveRecord::Base.connection
    connection.execute("INSERT INTO photo_placers (photo_id, place, url) VALUES (1, 'home', '/home')")
    connection.execute("INSERT INTO photo_placers (photo_id, place, url) VALUES (2, 'about pranav', '/about_pranav')")
    connection.execute("INSERT INTO photo_placers (photo_id, place, url) VALUES (3, 'lessons', '/lessons')")
    connection.execute("INSERT INTO photo_placers (photo_id, place, url) VALUES (4, 'contact', '/contact')")
  end

  def down
    drop_table :photo_placers
  end
end
