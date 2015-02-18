require "trakt_api"

class TrakttvController < ApplicationController
  def initialize
    super
    @api = TraktApi.new
  end

  def get_trending
   render json: @api.get_trending
  end

  def search
    render json: @api.search(params[:q])
  end
end
