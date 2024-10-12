class StaticPagesController < ApplicationController
  def index
    flickr = Flickr.new(ENV["FLICKR_API_KEY"], ENV["FLICKR_SECRET"])
    user_id = params[:user_id]
    @photos = flickr.photos.search(user_id: user_id) if params[:user_id]
  end
end
