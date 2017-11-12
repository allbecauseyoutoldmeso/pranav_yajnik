class HomeController < ApplicationController

  def index
  end

  def about_pranav
    @about_pranav = @pranav.about.html_safe
  end

  def gallery
    @photos = Photo.order(created_at: :desc)
  end

  def contact
  end
end
