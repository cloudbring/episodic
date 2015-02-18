require 'rails_helper'

RSpec.describe Tvshow, type: :model do
  context "with the show The Good Wife" do
    before(:each) do
      @tvshow = FactoryGirl.create(:the_good_wife)
    end

    it "has a title" do
      expect(@tvshow.title).to eq("The Good Wife")
    end
    it "has a trakt_id" do
      expect(@tvshow.trakt_id).to eq(1426)
    end
    it "has a poster_image" do
      expect(@tvshow.poster_image).to eq("https://walter.trakt.us/images/shows/000/001/426/posters/medium/749eeff986.jpg")
    end
  end
end


# require "rails_helper"

# RSpec.describe Post, :type => :model do
#   context "with 2 or more comments" do
#     it "orders them in reverse chronologically" do
#       post = Post.create!
#       comment1 = post.comments.create!(:body => "first comment")
#       comment2 = post.comments.create!(:body => "second comment")
#       expect(post.reload.comments).to eq([comment2, comment1])
#     end
#   end
# end