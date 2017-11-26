FactoryBot.define do

  factory :admin do
  end

  factory :lesson do
    day 1
    time '18:00'.to_time
  end

  factory :photo_placer do
    photo
    url '/'
  end

  factory :photo do
    image { File.new("#{Rails.root}/spec/support/test_image.jpg") }
  end

  factory :pranav do
    about 'Pranav Yajnik teaches kathak.'
    telephone_number '01234012012'
    email_address 'pranav@example.com'
    twitter_url 'pranav twitter'
    facebook_url 'pranav facebook'
  end

  factory :video do
  end
end
