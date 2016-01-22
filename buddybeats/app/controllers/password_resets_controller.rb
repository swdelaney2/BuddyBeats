class PasswordResetsController < ApplicationController


  def create
  account = Account.find_by_user_email(params[:email])
  puts 'testing'
  puts account
  if account
    account.send_password_reset
    redirect_to root_url, notice: "Email sent with password reset instructions."
  else
    redirect_to new_password_reset_path, notice: "Sorry, no account is registered with that e-mail address."
  end
end

def edit
  @account = Account.find_by_password_reset_token!(params[:id])
end

  def new
  end


  def update
  @account = Account.find_by_password_reset_token!(params[:id])
  if @account.password_reset_sent_at < 2.hours.ago
    redirect_to new_password_reset_path, notice: "Password &crarr;
      reset has expired."
  elsif @account.update(account_params)
    session[:account_id] = @account.id
    redirect_to '/playlists#index', notice: "Password has been reset."
  else
    render :edit
  end
end

private
def account_params
  params.require(:account).permit(:user_name, :user_email, :password, :password_confirmation)
end

end
