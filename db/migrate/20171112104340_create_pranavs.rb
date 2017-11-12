class CreatePranavs < ActiveRecord::Migration[5.1]
  def up
    create_table :pranavs do |t|
      t.text :about
      t.string :telephone_number
      t.string :email_address
      t.string :twitter_url
      t.string :facebook_url
    end

    connection = ActiveRecord::Base.connection
    connection.execute("INSERT INTO pranavs (about, telephone_number, email_address, twitter_url, facebook_url) VALUES ('<p>Pranav lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin scelerisque rhoncus felis, quis feugiat lorem rutrum eget. Aenean molestie porttitor accumsan. Proin tempus tellus vel nibh commodo, a pellentesque justo bibendum.</p>
    <p>Phasellus ac gravida eros, ut dapibus purus. Vivamus aliquet ex turpis, vitae sagittis est tristique sed. Nulla finibus purus vel nulla porta, id ultricies sapien faucibus. Cras eget luctus nulla.</p>
    <p>Aliquam egestas, neque quis laoreet lacinia, sem massa faucibus risus, in lacinia sem quam sit amet purus. Nullam non ipsum blandit, tristique lacus eget, tincidunt arcu.</p>', '01234012012', 'pranav@example.com', 'pranav', 'pranav')")
  end

  def down
    drop_table :pranavs
  end
end
