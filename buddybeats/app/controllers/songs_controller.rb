class SongsController < ApplicationController

  before_action :authorize

  def create
    @song = Song.new(song_params)
    if @song.save
      redirect_to '/songs/show'
      # render json: @song, status: :created
    else
      render json: @song.errors, status: :unprocessable_entity
    end
  end

  def destroy
  end

  def edit
  end

  def index
  end

  def new
    @song = Song.new
  end

  def search
    if @current_account.id == session[:playlist_owner]
      @song = Song.new
    elsif
      @songCount = Song.where(playlist_id: session[:random_hex], account_id: @current_account.id).count < session[:quantity]
      @song = Song.new
    else
      render plain: "Sorry, dude. You added too many songs."
    end
  end

  def show
    @songs = []
    Song.where(playlist_id: session[:random_hex]).find_each do |inc|
      @songs.push(inc)
    end
  end

  def update
  end

  private
    def song_params
      params.require(:song).permit(:title, :youtube_id, :playlist_id, :account_id)
    end
end
