class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :get_pranav

  def get_pranav
    @pranav = Pranav.first
  end

  def get_photo(place)
    @photo = photo_placer_photo(place)
  end

  def photo_placer_photo(place)
    PhotoPlacer.find_by(place: place).photo
  end

  def get_photo_placers
    @photo_placers = PhotoPlacer.order(:place)
  end
end
