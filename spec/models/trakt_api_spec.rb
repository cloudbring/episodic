require 'rails_helper'

RSpec.describe TrakttvController, type: :controller do
  describe "GET /search" do
    before(:each) do
      get :search, q: "The Good Wife"
    end

    it "responds in JSON" do
      expect(response.header['Content-Type']).to include 'application/json'
    end
  end
end