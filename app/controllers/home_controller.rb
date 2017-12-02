class HomeController < ApplicationController

  def index
    get_photo_url('home')
    @mobile_photo_url = photo_url('mobile home')
  end

  def about_pranav
    get_photo_url('about pranav')
    @about_pranav = @pranav.about.html_safe
  end

  def gallery
    @gallery_items = (Photo.all + Video.all).sort_by(&:created_at).reverse
    get_photo_placers
  end

  def contact
   get_photo_url('contact')
  end
end
