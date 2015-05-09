require 'trakt_api'
require 'api_helper'

class TrakttvController < ApplicationController
  def initialize
    super
    @@api = TraktApi.new
  end
 
  def get_popular
    @popular = @@api.get_popular
    @ids = @popular
        .collect { |result| result['ids']['trakt'] }
    @popular
        .each   { |result| save_or_update_show_for_get_popular!(result['ids']) }

    @popular_results = Tvshow.where(trakt_record: @ids)
    render :get_popular
  end
  
  def get_trending
    @trending = @@api.get_trending
    @ids = @trending
        .collect { |result| result['show']['ids']['trakt'] }

    @trending
        .each   { |result| save_or_update_show_for_get_trending!(result['show']) }

    @trending_results = Tvshow.where(trakt_record: @ids)
    render :get_trending
  end

  def api
    response.headers["Content-Type"] = "application/json"
    response.headers["trakt-api-key"] = "8988fc41d4c1491a0c0fb9199538b1a9a2e1cbeebd70ae762a5bfb5b9c35aea6"
    response.headers["trakt-api-version"] = "2"
    redirect_to "https://api-v2launch.trakt.tv/oauth/authorize?response_type=code&client_id=8988fc41d4c1491a0c0fb9199538b1a9a2e1cbeebd70ae762a5bfb5b9c35aea6&redirect_uri=urn:ietf:wg:oauth:2.0:oob&state=state&username=kenyacode"
  end

  def get_token
    @@api.get_token
  end

  def search
    @results = @@api.search(params[:q])
    @ids = @results
        .select  { |result| result['type'] == 'show'  }
        .collect { |result| result['show']['ids']['trakt'] }
    @results
        .select  { |result| result['type'] == 'show'  }
        .each { |result| save_or_update_show!(result['show']) }
    @search_results = Tvshow.where(trakt_record: @ids)
    render :search
  end

  private

  def trakt_params
    params.require(:trakttv)
      .permit(:search_results, :trakt_id)
  end

  def save_or_update_show!(show)
    trakt_id = show['ids']['trakt']
    synopsis = show['overview']
    tv_show = Tvshow.find_or_initialize_by(trakt_record: trakt_id)
    @@api.hydrate_tvshow(tv_show) if !tv_show.filled?
    tv_show.update_attributes(
      :title => show['title'],
      :poster_image => get_best_show_image(show['images']),
      :trakt_record => trakt_id,
      :official_synopsis => synopsis)
  end


  def get_best_show_image(images)
    images['poster']['thumb'] || images['fanart']['thumb']
  end

  def save_or_update_show_for_get_trending!(show)
    trakt_id = show['ids']['trakt']
    tv_show = Tvshow.find_or_initialize_by(trakt_record: trakt_id)
    @@api.hydrate_tvshow(tv_show) if !tv_show.filled?
    tv_show.update_attributes(
      :title => show['title'],
      :trakt_record => trakt_id)
  end

  def save_or_update_show_for_get_popular!(ids)
    trakt_id = ids['trakt']
    tv_show = Tvshow.find_or_initialize_by(trakt_record: trakt_id)
    @@api.hydrate_tvshow(tv_show) if !tv_show.filled?
    tv_show.update_attributes(
      :title => ids['slug'],
      :trakt_record => ids['trakt'],
      )
  end
end
