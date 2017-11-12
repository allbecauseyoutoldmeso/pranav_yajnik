class Photo < ActiveRecord::Base
  has_attached_file :image
  validates_attachment :image, content_type: { content_type: ['image/jpeg', 'image/gif', 'image/png'] }

  def international_url
    image.url.gsub('http://s3.amazonaws.com/pranav-photos', 'https://pranav-photos.s3.eu-west-2.amazonaws.com')
  end
end
