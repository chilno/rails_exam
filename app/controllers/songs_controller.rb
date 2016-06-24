class SongsController < ApplicationController
  def index
  	@songs = Song.all 
  end

  def show
  	@song = Song.find(params[:id])
  	@users = Playlist.where(song: @song).where.not(user: current_user)
  end

  def create
  	@song = Song.create(song_params)
  	unless @song.errors.any?
  		redirect_to '/songs'
  	else
  		flash[:errors] = @song.errors.full_messages
  		redirect_to '/songs'
  	end
  end

  private

  def song_params
  	params.require(:song).permit(:artist, :title)
  end
end
