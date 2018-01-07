class Photo < ActiveRecord::Base

  has_attached_file :image,
    styles: {
      thumb: '100x100',
      small: '600x600',
      medium: '800x800',
      large: '1000x1000'
    }

  validates_attachment :image, content_type: { content_type: ['image/jpeg', 'image/gif', 'image/png'] }

  has_many :photo_placers

  def shown
    !hidden
  end

  def international_url(size=:original)
    image.url(size).gsub('http://s3.amazonaws.com/pranav-photos', 'https://pranav-photos.s3.eu-west-2.amazonaws.com')
  end
end
