class AccountMailer < ActionMailer::Base
  default from: "from@example.com"

  def password_reset(account)
    @account = account
    mail :to => account.user_email, :subject => "Password Reset"
  end
end
