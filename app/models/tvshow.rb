class Tvshow < ActiveRecord::Base
  #attr_accessor :trakt_record
  validates :trakt_record, presence: true, uniqueness: true
  has_one :synopsis
  has_many :rewrites, through: :synopsis

  def filled?
    # Checks if any of these values are nil
    # to see if it hasn't been filled by the second API call
    !self.airs_day.nil? ||
      !self.airs_time.nil? ||
      !self.airs_timezone.nil? ||
      !self.runtime.nil? ||
      !self.certification.nil? ||
      !self.network.nil? ||
      !self.status.nil?
  end
end
