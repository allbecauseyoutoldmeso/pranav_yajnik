class PranavsController < ApplicationController

  before_action :authenticate_admin!

  def edit
  end

  def update
    @pranav.update(pranav_params)
    redirect_to '/about_pranav'
  end

  private

  def pranav_params
    params.require(:pranav).permit(:about, :telephone_number, :email_address, :twitter_url, :facebook_url)
  end
end
