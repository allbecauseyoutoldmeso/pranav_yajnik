class CreatePhotoPlacers < ActiveRecord::Migration[5.1]

  def up
    create_table :photo_placers do |t|
      t.belongs_to :photo
      t.string :place
      t.string :url
    end

    connection = ActiveRecord::Base.connection
    photo_id =  Photo.first.id
    connection.execute("INSERT INTO photo_placers (photo_id, place, url) VALUES (#{photo_id}, 'home', '/')")
    connection.execute("INSERT INTO photo_placers (photo_id, place, url) VALUES (#{photo_id}, 'mobile home', '/')")
    connection.execute("INSERT INTO photo_placers (photo_id, place, url) VALUES (#{photo_id}, 'about pranav', '/about_pranav')")
    connection.execute("INSERT INTO photo_placers (photo_id, place, url) VALUES (#{photo_id}, 'lessons', '/lessons')")
    connection.execute("INSERT INTO photo_placers (photo_id, place, url) VALUES (#{photo_id}, 'contact', '/contact')")
  end

  def down
    drop_table :photo_placers
  end
end
