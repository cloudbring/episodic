class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  attr_accessor :username, :email

  has_many :rewrites, dependent: :destroy

  attr_reader :password
  field :password_digest, type: String

  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates :password, presence: true, confirmation: true, length: { in: 6..20 }
  validates :password, confirmation: true, length:{in:6..20}, on: :update, allow_blank: true

  def password=(unencrypted_password)
    unless unencrypted_password.empty?
      # keep the unencrypted password in memory for a second
      @password = unencrypted_password
      # use BCrypt to encrypt our plain password into a digest
      # and store it in our database
      self.password_digest = BCrypt::Password.create(unencrypted_password)
      end
    end

  def authenticate(unencrypted_password)
    if BCrypt::Password.new(self.password_digest) == unencrypted_password
      return self
    else
      return false
    end
  end
end
