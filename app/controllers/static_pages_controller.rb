class StaticPagesController < ApplicationController
  def index
    flickr = Flickr.new(ENV["FLICKR_API_KEY"], ENV["FLICKR_SECRET"])
    user_id = params[:user_id]
    begin
      @photos = flickr.photos.search(user_id: user_id) if params[:user_id]
      respond_to do |format|
        format.html
        format.xml { render xml: @photos }
        format.json { render json: @photos }
      end
    rescue Flickr::FailedResponse => e
      @error = "Failed to fetch photos: #{e.message}"
      @photos = []
    end
  end
end

