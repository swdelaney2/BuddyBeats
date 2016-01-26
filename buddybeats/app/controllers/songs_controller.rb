class SongsController < ApplicationController

  before_action :authorize

  def create
    @song = Song.new(song_params)
    if @song.save
      if @song.spotify_id
        redirect_to '/songs/spotifyshow'
      else
        redirect_to '/songs/show'
      end
    else
      render json: @song.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy
    redirect_to :back
  end

  def edit
    @song = Song.find(params[:id])
  end

  def new
    @song = Song.new
  end

  def search
    # allow owner to add as many as they like
    if @current_account.id == session[:playlist_owner]
      @song = Song.new
      # limit others to only add as many songs as the owner designated
    elsif @songCount = Song.where(playlist_id: session[:playlist_id], account_id: @current_account.id).count < session[:quantity]
      @song = Song.new
    else
      redirect_to :back, notice: "Sorry, you have reached the limit of song additions as specified by the playlist owner."
    end
  end

  def show
    all_accounts
    @songs = []
    Song.where(playlist_hex: session[:playlist_hex]).find_each do |inc|
      @songs.push(inc)
    end
    if @current_account.id == session[:playlist_owner]
      @owner = true
    end
  end

# The search and show are identical, but this tells the Spotify pages which methods to use.
  def spotifysearch
    search
  end

  def spotifyshow
    show
  end

  def mysongs
    @songs = []
    Song.where(account_id: @current_account.id).find_each do |inc|
      @songs.push(inc)
    end
  end

  def update
    @song = Song.find(params[:id])
    if @song.update(song_params)
      redirect_to '/songs/mysongs'
    else
      render json: @song.errors, status: :unprocessable_entity
    end
  end

  def index
  end

  private
    def song_params
      params.require(:song).permit(:title, :youtube_id, :spotify_img, :spotify_id, :playlist_id, :playlist_hex, :account_id)
    end
end
