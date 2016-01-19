class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_account
    @current_account ||= Account.find(session[:account_id]) if session[:account_id]
  end

  def authorize
     redirect_to '/login' unless current_account
   end

   def register_authorize
     if current_account
       redirect_to '/playlists'
    end
  end

end
