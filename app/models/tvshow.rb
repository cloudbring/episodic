class Tvshow < ActiveRecord::Base
  attr_accessor :trakt_id
  validates :trakt_id, presence: true #, uniqueness: true
end
