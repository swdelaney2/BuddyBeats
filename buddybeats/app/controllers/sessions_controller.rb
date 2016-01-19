class SessionsController < ApplicationController

  #log-in form
  def new
    @account
  end

  #log-in post
  def create
    account = Account.find_by(user_email: params[:user_email])
    if account && account.authenticate(params[:password])
      session[:account_id] = account.id
      redirect_to '/'
    else
      render 'new'
    end
  end

  #log-out
  def destroy
    session[:account_id] = nil
    redirect_to '/login'
  end


end
