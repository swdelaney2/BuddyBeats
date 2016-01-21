class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :counter

  def current_account
    # session[:account_id] = nil   (if you forget to logout before you drop databases)
    @current_account ||= Account.find(session[:account_id]) if session[:account_id]
  end

  def all_accounts
    @all_accounts = Account.all
  end


  def authorize
     redirect_to '/' unless current_account
   end

   def register_authorize
     if current_account
       redirect_to '/playlists'
    end
  end

  def counter
    @song_count = Song.all.count
    @playlist_count = Playlist.all.count
  end

end
