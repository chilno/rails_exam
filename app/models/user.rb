class User < ActiveRecord::Base
  has_secure_password
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  has_many :songs, through: :playlists
  has_many :playlists
  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: {case_sensitive: false}, format: {with: EMAIL_REGEX}

  before_save do
  	self.email.downcase!
  end
end
