class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :get_pranav

  def get_pranav
    @pranav = Pranav.first
  end

  def get_photo_url(place)
    @photo_url = PhotoPlacer.find_by(place: place).photo.international_url
  end
end
