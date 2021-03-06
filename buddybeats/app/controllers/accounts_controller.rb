class AccountsController < ApplicationController

  def index
    @current_account = current_account
  end


  def new
    register_authorize
    @account = Account.new
  end

  def create
    @account = Account.new(account_params)
    if @account.save
      session[:account_id] = @account.id
      @account_error = ""
      url = session[:original_url]
      session[:original_url] = nil
      if url
        redirect_to url
      else
        redirect_to '/playlists#index'
      end
    elsif @account.errors.messages.key?(:user_name)
      @account_error = "Sorry, that username is already taken."
      render 'new'
    elsif @account.errors.messages.key?(:user_email)
      @account_error = "Sorry, an account has already been registered with that e-mail address."
      render 'new'
    else
      render 'new'
    end
  end

  def edit
  end

  def show
  end

  def update
  end

  private
  def account_params
    params.require(:account).permit(:user_name, :user_email, :password, :password_confirmation)
  end

end
