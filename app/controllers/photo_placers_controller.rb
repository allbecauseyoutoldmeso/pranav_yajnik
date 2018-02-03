class PhotoPlacersController < ApplicationController

  def update
    photo_placer = PhotoPlacer.find(params[:id])
    photo_placer.update_attribute(:photo_id, params[:photo_id])
    @photo = Photo.find(params[:photo_id])
    get_photo_placers
    render 'photos/photo_frame'
  end
end
