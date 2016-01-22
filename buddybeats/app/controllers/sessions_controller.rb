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
      @login_error = ""
      url = session[:original_url]
      session[:original_url] = nil
      if url
        redirect_to url
      else
        redirect_to '/'
      end
    else
      @login_error = "Sorry, you entered an incorrect username or password. Please try again."
      render 'new'
    end
  end

  #log-out
  def destroy
    session[:account_id] = nil
    redirect_to '/login'
  end


end
