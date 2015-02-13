class SearchController < ApplicationController
  def search
    client = OAuth2::Client.new(CLIENT_ID, CLIENT_SECRET, :site => 'http://localhost:3000')
    token = OAuth2::AccessToken.new(client, ACCESS_TOKEN)
    result = token.get("https://api-v2launch.trakt.tv/search?query=shameless", headers: HEADERS).parsed
    render json: result
  end
end
