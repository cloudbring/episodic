require 'trakt_api'
require 'api_helper'

class TrakttvController < ApplicationController
  def initialize
    super
    @@api = TraktApi.new
  end

  def get_trending
   render json: @@api.get_trending
  end

  def search
    @results = @@api.search(params[:q])

    @ids = @results
        .select  { |result| result['type'] == 'show'  }
        .collect { |result| result['show']['ids']['trakt'] }

    @results
        .select  { |result| result['type'] = 'show'  }
        .each { |result| save_or_update_show!(result['show']) }

    #ApiHelper.add_results_to_db!(@results)
    #@ids = ApiHelper.get_search_result_ids(@results)
    @search_results = Tvshow.where(trakt_record: @ids)
    render :search
  end

  private

  def trakt_params
    params.require(:trakttv)
      .permit(:search_results, :trakt_id)
  end

  def save_or_update_show!(show)
    tv_id = show['ids']['trakt']
    tv_show = Tvshow.find_or_initialize_by(trakt_record: tv_id)
    tv_show.update_attributes(
      :title => show['title'],
      :poster_image => get_best_show_image(show['images']),
      :trakt_record => tv_id
    )
    tv_show.save!
  end

  def get_best_show_image(images)
    images['poster']['thumb'] || images['fanart']['thumb']
  end
end
