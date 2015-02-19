require "trakt_api"

class TrakttvController < ApplicationController
  def initialize
    super
    @@api = TraktApi.new
  end

  def get_trending
   render json: @api.get_trending
  end

  def search
    @results = @@api.search(params[:q])
    #render json: @api.search(params[:q])
    render :searchhuhuh
    # if @tvshow.save
    #   redirect_to tvshow_path
    # else
    #   render :new
    # end
  end
end
