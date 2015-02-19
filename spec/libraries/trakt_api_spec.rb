require 'rails_helper'
require 'trakt_api'
require 'api_helper'

VCR.use_cassette('TraktAPI') do
  RSpec.describe Tvshow do

    before do
      @@api = TraktApi.new
      @results = @@api.search("The Good Wife")
      ApiHelper.add_results_to_db!(@results)
    end

    it 'should make a search result' do
      expect(@results).to be_an(Array)
    end

    context 'for a TV Show' do
      it 'should create a Tvshow record' do
        expect(Tvshow.all.count).to be >= 1
      end
      #it 'should create a Synopsis' do
        #expect(Synopsis.all.count).to be >= 1
      #end
    end

    context 'for an Episode' do
      it 'should create an Episode record'
      it 'should create Synopsis'
    end
  end
end
