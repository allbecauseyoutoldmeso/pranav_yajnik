class HomeController < ApplicationController

  def index
    get_photo('home')
    @mobile_photo = photo_placer_photo('mobile home')
  end

  def about_pranav
    get_photo('about pranav')
    @about_pranav = @pranav.about.html_safe
  end

  def gallery
    @gallery_items = (Photo.all + Video.all).sort_by(&:created_at).reverse
    get_photo_placers
  end

  def contact
   get_photo('contact')
  end
end
