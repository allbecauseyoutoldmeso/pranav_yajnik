class VideosController < ApplicationController

  before_action :authenticate_admin!

  def new
    @video = Video.new
  end

  def create
    @video = Video.new(video_params)
    if @video.save
      redirect_to '/gallery'
    else
      render 'new'
    end
  end

  def destroy
    video = Video.find(params[:id])
    video.destroy
    redirect_to '/gallery'
  end

  private

  def video_params
    params.require(:video).permit(:caption, :you_tube_id)
  end
end
