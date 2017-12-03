class SitemapController < ApplicationController
  respond_to :xml

  def index
    @pages = ['/about_pranav', '/gallery', '/lessons', '/contact']
  end
end
