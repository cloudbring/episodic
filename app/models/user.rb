class User < ActiveRecord::Base
  attr_accessor :username, :email

  has_many: rewrites
end
