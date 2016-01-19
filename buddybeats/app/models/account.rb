class Account < ActiveRecord::Base
  has_secure_password

  has_many :playlists
  has_many :songs
end
