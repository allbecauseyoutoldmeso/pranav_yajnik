FactoryBot.define do

  factory :admin do
  end

  factory :lesson do
  end

  factory :photo_placer do
  end

  factory :photo do
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
