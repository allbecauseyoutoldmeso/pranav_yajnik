FactoryBot.define do

  factory :admin do
  end

  factory :lesson do
    day 1
    start_time '18:00'.to_time
    what 'Beginners'
    where '123 Pranav Street, London, AB1 2CD'
    freetext 'Kathak lessons for beginners'
  end

  factory :photo_placer do
    photo
    url '/'
  end

  factory :photo do
    image_file_name { 'test.jpg' }
    image_content_type { 'image/jpeg' }
    image_file_size { 256 }
  end

  factory :pranav do
    about 'Pranav Yajnik teaches kathak.'
    telephone_number '01234012012'
    email_address 'pranav@example.com'
    twitter_url 'pranav_twitter'
    facebook_url 'pranav_facebook'
  end

  factory :video do
  end
end
