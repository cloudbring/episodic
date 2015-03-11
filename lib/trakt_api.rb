class TraktApi
  include HTTParty

  CLIENT_ID     = "8988fc41d4c1491a0c0fb9199538b1a9a2e1cbeebd70ae762a5bfb5b9c35aea6"
  CLIENT_SECRET = "de1daaeb52ea16099e68cb5d35cc22201e444910054bdec3d54025ad4c8575e7"
  ACCESS_TOKEN  = "5ddc58ff493e8b741fd223f9e5b54e4bfac1e652234579a9808a082d26903bbf"
  HEADERS =
    {
      "Content-Type" => "application/json",
      "trakt-api-key" => "8988fc41d4c1491a0c0fb9199538b1a9a2e1cbeebd70ae762a5bfb5b9c35aea6",
      "trakt-api-version" => "2"
    }
  TRAKT_HOST     = "https://api-v2launch.trakt.tv"
  TRAKT_TRENDING = TRAKT_HOST + "/shows/trending"
  TRAKT_SEARCH   = TRAKT_HOST + "/search"
  TRAKT_SHOW     = TRAKT_HOST + "/shows/" # Must add #{trakt_id} after it

  def initialize(id = CLIENT_ID, secret = CLIENT_SECRET)
    client = OAuth2::Client.new(
      id,
      secret,
      :site => 'http://localhost:3000')
    @@token = OAuth2::AccessToken.new(client, ACCESS_TOKEN)
  end

  def get_token
    headers = {}

    body = {
      "code" => "9bf072ea8753cf1f0b36aa826de3ed68623eb8ab12f40f5a3bd66667b6fc0481", 
      "client_id" => "8988fc41d4c1491a0c0fb9199538b1a9a2e1cbeebd70ae762a5bfb5b9c35aea6", 
      "client_secret" => "de1daaeb52ea16099e68cb5d35cc22201e444910054bdec3d54025ad4c8575e7", 
      "redirect_uri" => "urn:ietf:wg:oauth:2.0:oob",
      "grant_type" => "authorization_code"
    }

    result = HTTParty.post("https://api-v2launch.trakt.tv/oauth/token", 
      :body => body.to_json,
      :headers => HEADERS)

    [ result.code, result.body, result.headers.inspect].inspect
  end

  def get_show(trakt_id)
    @@token.get(TRAKT_SHOW + "#{trakt_id}?extended=full", headers: HEADERS).parsed
  end

  def hydrate_tvshow(tv_show)
    api_show = @@token.get(TRAKT_SHOW + "#{tv_show.trakt_record}?extended=full", headers: HEADERS).parsed
    attributes = {}
    attributes[:airs_time]      = api_show['airs']['time']
    attributes[:airs_timezone]  = api_show['airs']['timezone']
    attributes[:runtime]        = api_show['runtime']
    attributes[:certification]  = api_show['certification']
    attributes[:network]        = api_show['network']
    attributes[:status]         = api_show['status']
    attributes[:aired_episodes] = api_show['aired_episodes']

    tv_show.update_attributes(attributes)
  end


  def get_trending
    @@token.get(TRAKT_TRENDING, headers: HEADERS).parsed
  end

  def search(query)
    search_phrase = URI.encode(query)
    @@token.get(TRAKT_SEARCH + "?query=#{search_phrase}&type=show", headers: HEADERS).parsed
  end
end
