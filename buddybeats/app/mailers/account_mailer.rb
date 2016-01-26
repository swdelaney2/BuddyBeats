class AccountMailer < ActionMailer::Base
  default from: "noreply@buddybeats.com"

  def password_reset(account)
    @account = account
    mail :to => account.user_email, :subject => "Password Reset"
  end

end
