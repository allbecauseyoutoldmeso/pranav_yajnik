class HomeController < ApplicationController

  def index
  end

  def about_pranav
  end

  def gallery
    @photos = Photo.order(created_at: :desc)
  end

  def contact
  end
end
