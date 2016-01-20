class PlaylistsController < ApplicationController

  before_action :authorize

  def index
    @playlists = Playlist.all

    # render json: @playlists, status: :ok
  end

  def mylists
    @playlists = []
    Playlist.where(account_id: @current_account.id).find_each do |inc|
      @playlists.push(inc)
    end
    if @playlists
    else
      render json: @playlist.errors, status: :unprocessable_entity
    end
  end

  def all
    @playlists = []
    Playlist.where(public: true).find_each do |inc|
      @playlists.push(inc)
    end
    if @playlists
    else
      render json: @playlist.errors, status: :unprocessable_entity
    end
  end

  def show
    @playlist = Playlist.find_by(random_hex: params[:random_hex])
    if @playlist
      session[:playlist_title] = @playlist.title
      session[:playlist_description] = @playlist.description
      session[:playlist_hex] = @playlist.random_hex
      session[:playlist_owner] = @playlist.account_id
      session[:quantity] = @playlist.quantity
      session[:playlist_id] = @playlist.id

      redirect_to '/songs/show'
      # render json: @playlist, status: :ok
    else
      render json: @playlist.errors, status: :unprocessable_entity
    end
  end

  def create
    @playlist = Playlist.new(playlist_params)
    if @playlist.save
      redirect_to '/playlists/mylists'
      # render json: @playlist, status: :created
    else
      render json: @playlist.errors, status: :unprocessable_entity
    end
  end

  def update
    @playlist = Playlist.find(params[:id])
    if @playlist.update(playlist_params)
      head :no_content
    else
      render json: @playlist.errors, status: :unprocessable_entity
    end
  end

  # def destroy
  #   # confirm: ('Are you sure you want to delete this playlist?')
  #   @playlist = Playlist.find(params[:id])
  #   if @playlist
  #     @playlist.destroy
  #     head :no_content
  #     render plain: "deleted!"
  #
  #   else
  #       render json: @playlist.errors, status: :unprocessable_entity
  #   end
  # end

  def destroy
    @playlist = Playlist.find(params[:id])
    @playlist.destroy

    redirect_to playlists_path
  end

  def edit
  end

  def new
    @playlist = Playlist.new
  end

  private
    def playlist_params
      params.require(:playlist).permit(:title, :description, :public, :quantity, :account_id, :random_hex)
    end


end
