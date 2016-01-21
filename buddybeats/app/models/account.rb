class Account < ActiveRecord::Base
  has_secure_password

  has_many :playlists
  has_many :songs


  validates_uniqueness_of :user_name, :case_sensitive => false
  validates_uniqueness_of :user_email, :case_sensitive => false

end
