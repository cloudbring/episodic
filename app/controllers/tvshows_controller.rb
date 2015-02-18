class TvshowsController < ApplicationController
  include HTTParty
  CLIENT_ID = "8988fc41d4c1491a0c0fb9199538b1a9a2e1cbeebd70ae762a5bfb5b9c35aea6"
  CLIENT_SECRET = "de1daaeb52ea16099e68cb5d35cc22201e444910054bdec3d54025ad4c8575e7"
  ACCESS_TOKEN = "0bb2cd99a0c5ea1a73ac86aab7b86b3dfad348600e9aa94f696931e3c334fe8e"
  HEADERS = {"Content-Type" => "application/json", 
            "trakt-api-key" => "8988fc41d4c1491a0c0fb9199538b1a9a2e1cbeebd70ae762a5bfb5b9c35aea6", 
            "trakt-api-version" => "2"}

  def get_trending
    client = OAuth2::Client.new(CLIENT_ID, CLIENT_SECRET, :site => 'http://localhost:3000')
    token = OAuth2::AccessToken.new(client, ACCESS_TOKEN)
    result = token.get("https://api-v2launch.trakt.tv/shows/trending", headers: HEADERS).parsed
    render json: result
  end
  def search
    search_phrase = URI.encode(params[:q])
    client = OAuth2::Client.new(CLIENT_ID, CLIENT_SECRET, :site => 'http://localhost:3000')
    token = OAuth2::AccessToken.new(client, ACCESS_TOKEN)
    result = token.get("https://api-v2launch.trakt.tv/search?query=#{search_phrase}", headers: HEADERS).parsed
    render json: result
  end
  def find   
  end
  def index
    @tvshows = Tvshow.all
  end
  def show
    @tvshow = Tvshow.find(params[:id])
    respond_to do |format|
      format.json { render json: @tvshow}    
  end
end