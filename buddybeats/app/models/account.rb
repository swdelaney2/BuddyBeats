class Account < ActiveRecord::Base
  has_secure_password
  before_create { generate_token(:auth_token) }

  has_many :playlists
  has_many :songs

  validates_uniqueness_of :user_name, :case_sensitive => false
  validates_uniqueness_of :user_email, :case_sensitive => false

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    AccountMailer.password_reset(self).deliver
  end

  def generate_token(column)
  begin
    self[column] = SecureRandom.urlsafe_base64
  end while Account.exists?(column => self[column])
end

end
