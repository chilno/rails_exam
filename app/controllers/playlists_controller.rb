class PlaylistsController < ApplicationController
	def create
		Playlist.create(user_id: params[:user_ids], song_id: params[:song_ids])
		redirect_to '/songs'
	end
end
