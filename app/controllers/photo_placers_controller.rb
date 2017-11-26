class PhotoPlacersController < ApplicationController

  def update
    photo_placer = PhotoPlacer.find(params[:id])
    photo_placer.update_attribute(:photo_id, params[:photo_id])
    redirect_to photo_placer.url
  end
end
