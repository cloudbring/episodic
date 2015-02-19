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

    add_results_to_db!(@results)


    #render json: @api.search(params[:q])
    render :search
    # if @tvshow.save
    #   redirect_to tvshow_path
    # else
    #   render :new
    # end
  end

  private

  def add_results_to_db!(results)
    if(results != nil)
      # Get TV Shows from Results Object
      @shows = results.select { |result| result['type'] == "show" }

      # Make TVShow Model records from TV Show Objects
      @shows.each { |show| save_or_update_show(show) }
    end
  end
end
