class Playlist < ActiveRecord::Base
  has_many :songs, :dependent => :destroy
  belongs_to :account

end
