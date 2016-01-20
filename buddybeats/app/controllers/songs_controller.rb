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
    @song = Song.find(params[:id])
    @song.destroy

    redirect_to '/songs/mysongs'
  end

  def edit
    @song = Song.find(params[:id])
  end

  def index
  end

  def new
    @song = Song.new
  end

  def search
    # allow owner to add as many as they like
    if @current_account.id == session[:playlist_owner]
      @song = Song.new
      # limit others to only add as many songs as the owner designated
    elsif
      @songCount = Song.where(playlist_id: session[:id], account_id: @current_account.id).count < session[:quantity]
      @song = Song.new
    else
      render plain: "Sorry, dude. You added too many songs."
    end
  end

  def show
    @songs = []
    Song.where(playlist_hex: session[:playlist_hex]).find_each do |inc|
      @songs.push(inc)
    end
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
      # puts "testing"
      # puts song_params
      redirect_to '/songs/mysongs'
    else
      render json: @song.errors, status: :unprocessable_entity
    end
  end

  private
    def song_params
      params.require(:song).permit(:title, :youtube_id, :playlist_id, :playlist_hex, :account_id)
    end
end
