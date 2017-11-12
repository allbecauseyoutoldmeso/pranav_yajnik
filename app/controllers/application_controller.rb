class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :get_pranav

  def get_pranav
    @pranav = Pranav.first
  end
end
