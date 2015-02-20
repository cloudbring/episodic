class Synopsis < ActiveRecord::Base

  has_many :rewrites
  belongs_to :tvshow
end
