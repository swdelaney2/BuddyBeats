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
      redirect_to '/playlists#index'
      # redirect_to '/login'
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
