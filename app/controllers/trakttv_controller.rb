class TrakttvController < ApplicationController

  include HTTParty
  CLIENT_ID = "8988fc41d4c1491a0c0fb9199538b1a9a2e1cbeebd70ae762a5bfb5b9c35aea6"
  CLIENT_SECRET = "de1daaeb52ea16099e68cb5d35cc22201e444910054bdec3d54025ad4c8575e7"
  ACCESS_TOKEN = "0bb2cd99a0c5ea1a73ac86aab7b86b3dfad348600e9aa94f696931e3c334fe8e"
  HEADERS = {"Content-Type" => "application/json", 
            "trakt-api-key" => "8988fc41d4c1491a0c0fb9199538b1a9a2e1cbeebd70ae762a5bfb5b9c35aea6", 
            "trakt-api-version" => "2"}

  def api
    response.headers["Content-Type"] = "application/json"
    response.headers["trakt-api-key"] = "8988fc41d4c1491a0c0fb9199538b1a9a2e1cbeebd70ae762a5bfb5b9c35aea6"
    response.headers["trakt-api-version"] = "2"
    redirect_to "https://api-v2launch.trakt.tv/oauth/authorize?response_type=code&client_id=8988fc41d4c1491a0c0fb9199538b1a9a2e1cbeebd70ae762a5bfb5b9c35aea6&redirect_uri=urn:ietf:wg:oauth:2.0:oob&state=state&username=kenyacode"
  end

  def get_token
    headers = {}

    body = {"code" => "9bf072ea8753cf1f0b36aa826de3ed68623eb8ab12f40f5a3bd66667b6fc0481", 
      "client_id" => "8988fc41d4c1491a0c0fb9199538b1a9a2e1cbeebd70ae762a5bfb5b9c35aea6", 
      "client_secret" => "de1daaeb52ea16099e68cb5d35cc22201e444910054bdec3d54025ad4c8575e7", 
      "redirect_uri" => "urn:ietf:wg:oauth:2.0:oob",
      "grant_type" => "authorization_code"}

    result = HTTParty.post("https://api-v2launch.trakt.tv/oauth/token", 
      :body => body.to_json,
      :headers => HEADERS)

    render json: [ result.code, result.body, result.headers.inspect].inspect
  end
end
