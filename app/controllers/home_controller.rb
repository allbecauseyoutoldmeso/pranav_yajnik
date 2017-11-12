class HomeController < ApplicationController

  def index
  end

  def about_pranav
    @about_pranav = @pranav.about.html_safe
  end

  def gallery
    @gallery_items = (Photo.all + Video.all).sort_by(&:created_at).reverse
  end

  def contact
  end
end
