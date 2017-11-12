class PhotosController < ApplicationController

  before_action :authenticate_admin!

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    if @photo.save
      redirect_to '/gallery'
    else
      render 'new'
    end
  end

  def destroy
    photo = Photo.find(params[:id])
    photo.destroy
    redirect_to '/gallery'
  end

  private

  def photo_params
    params.require(:photo).permit(:image, :caption)
  end
end
