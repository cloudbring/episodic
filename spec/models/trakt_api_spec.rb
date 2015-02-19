require 'rails_helper'


#
# Failure/Error: get :search, q: "The Good Wife"
#   VCR::Errors::UnhandledHTTPRequestError:
#
#
#     ================================================================================
#     An HTTP request has been made that VCR does not know how to handle:
#       GET https://api-v2launch.trakt.tv/search?query=The%20Good%20Wife&type=show
#
#     There is currently no cassette in use. There are a few ways
#     you can configure VCR to handle this request:
#
#       * If you're surprised VCR is raising this error
#         and want insight about how VCR attempted to handle the request,
#         you can use the debug_logger configuration option to log more details [1].
#       * If you want VCR to record this request and play it back during future test
#         runs, you should wrap your test (or this portion of your test) in a
#         `VCR.use_cassette` block [2].
#       * If you only want VCR to handle requests made while a cassette is in use,
#         configure `allow_http_connections_when_no_cassette = true`. VCR will
#         ignore this request since it is made when there is no cassette [3].
#       * If you want VCR to ignore this request (and others like it), you can
#         set an `ignore_request` callback [4].
#
#     [1] https://www.relishapp.com/vcr/vcr/v/2-9-3/docs/configuration/debug-logging
#     [2] https://www.relishapp.com/vcr/vcr/v/2-9-3/docs/getting-started
#     [3] https://www.relishapp.com/vcr/vcr/v/2-9-3/docs/configuration/allow-http-connections-when-no-cassette
#     [4] https://www.relishapp.com/vcr/vcr/v/2-9-3/docs/configuration/ignore-request
#     ================================================================================
VCR.use_cassette('TraktAPI') do
  RSpec.describe TrakttvController, type: :controller do
    describe "GET /search" do
      before(:each) do
        get :search, q: "The Good Wife"
      end

      it { should render_template('search') }
      #it { should render_template(partial: 'sidebar') }
    end
  end
end
