class SongsController < ApplicationController

  before_action :authorize

  def create
    @song = Song.new(song_params)
    if @song.save
      render json: @song, status: :created
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
    @song = Song.new
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
