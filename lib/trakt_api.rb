class TraktApi
  include HTTParty
  CLIENT_ID = "8988fc41d4c1491a0c0fb9199538b1a9a2e1cbeebd70ae762a5bfb5b9c35aea6"
  CLIENT_SECRET = "de1daaeb52ea16099e68cb5d35cc22201e444910054bdec3d54025ad4c8575e7"
  ACCESS_TOKEN = "0bb2cd99a0c5ea1a73ac86aab7b86b3dfad348600e9aa94f696931e3c334fe8e"
  HEADERS = {"Content-Type" => "application/json",
            "trakt-api-key" => "8988fc41d4c1491a0c0fb9199538b1a9a2e1cbeebd70ae762a5bfb5b9c35aea6",
            "trakt-api-version" => "2"}
  TRAKT_HOST = "https://api-v2launch.trakt.tv"
  TRAKT_TRENDING = TRAKT_HOST + "/shows/trending"
  TRAKT_SEARCH = TRAKT_HOST + "/search"

  def initialize(id = CLIENT_ID, secret = CLIENT_SECRET)
    client = OAuth2::Client.new(
      id,
      secret,
      :site => 'http://localhost:3000')
    @@token = OAuth2::AccessToken.new(client, ACCESS_TOKEN)
  end

  # def api
  #   response.headers["Content-Type"] = "application/json"
  #   response.headers["trakt-api-key"] = "8988fc41d4c1491a0c0fb9199538b1a9a2e1cbeebd70ae762a5bfb5b9c35aea6"
  #   response.headers["trakt-api-version"] = "2"
  #   redirect_to "https://api-v2launch.trakt.tv/oauth/authorize?response_type=code&client_id=8988fc41d4c1491a0c0fb9199538b1a9a2e1cbeebd70ae762a5bfb5b9c35aea6&redirect_uri=urn:ietf:wg:oauth:2.0:oob&state=state&username=kenyacode"
  # end

  # def get_token
  #   headers = {}

  #   body = {"code" => "9bf072ea8753cf1f0b36aa826de3ed68623eb8ab12f40f5a3bd66667b6fc0481", 
  #     "client_id" => "8988fc41d4c1491a0c0fb9199538b1a9a2e1cbeebd70ae762a5bfb5b9c35aea6", 
  #     "client_secret" => "de1daaeb52ea16099e68cb5d35cc22201e444910054bdec3d54025ad4c8575e7", 
  #     "redirect_uri" => "urn:ietf:wg:oauth:2.0:oob",
  #     "grant_type" => "authorization_code"}

  #   result = HTTParty.post("https://api-v2launch.trakt.tv/oauth/token", 
  #     :body => body.to_json,
  #     :headers => HEADERS)

  #   [ result.code, result.body, result.headers.inspect].inspect
  # end
  
  def get_trending
    @@token.get(TRAKT_TRENDING, headers: HEADERS).parsed
  end

  def search(query)
    search_phrase = URI.encode(query)
    #search_phrase = URI.encode("The Good Wife")
    @@token.get(TRAKT_SEARCH + "?query=#{search_phrase}&type=show", headers: HEADERS).parsed
  end
end