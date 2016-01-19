class Playlist < ActiveRecord::Base
  has_many :songs
  belongs_to :account
end
