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

# This function checks to see if the user is logged-in. It also saves the URL they are attempting to visit, so that after they log-in, they will be rerouted back there.
  def authorize
    session[:original_url] = request.url
     redirect_to '/' unless current_account
   end

# Looking at the method above, a separate method is needed when users come straight to the main page and register.
   def register_authorize
     if current_account
       redirect_to '/playlists'
    end
  end

# For providing stats in the footer
  def counter
    @song_count = Song.all.count
    @playlist_count = Playlist.all.count
  end


end
