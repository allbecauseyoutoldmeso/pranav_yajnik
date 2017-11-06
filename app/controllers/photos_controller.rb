class PhotosController < ActionController::Base

  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    if @photo.save
      flash[:notice] = 'Photo successfully added'
      redirect_to index
    else
      render 'new'
    end
  end

  private

  def photo_params
    params.permit(:photo, :caption, :image)
  end
end
