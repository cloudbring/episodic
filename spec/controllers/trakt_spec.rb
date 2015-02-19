require 'rails_helper'

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

