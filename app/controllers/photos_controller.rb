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

  def update
    photo = Photo.find(params[:id])
    photo.update(photo_params)
    redirect_to '/gallery'
  end

  def destroy
    redirect_to '/gallery' and return if Photo.count == 1
    photo = Photo.find(params[:id])
    update_placeholders(photo)
    photo.destroy
    redirect_to '/gallery'
  end

  private

  def update_placeholders(photo)
    photo.photo_placers.update_all(photo_id: safe_photo(photo).id)
  end

  def safe_photo(photo)
    photo == first_photo ?  Photo.last : first_photo
  end

  def first_photo
    @first_photo ||= Photo.first
  end

  def photo_params
    params.require(:photo).permit(:image, :caption, :hidden)
  end
end
