class Tvshow < ActiveRecord::Base
  #attr_accessor :trakt_record
  validates :trakt_record, presence: true, uniqueness: true
end
