require 'trakt_api'
require 'api_helper'

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

    ApiHelper.add_results_to_db!(@results)


    #render json: @api.search(params[:q])
    render :search
    # if @tvshow.save
    #   redirect_to tvshow_path
    # else
    #   render :new
    # end
  end
end
