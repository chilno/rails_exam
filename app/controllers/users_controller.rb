class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  	@songs = Playlist.where(user: @user)
  end

  def create
  	@user = User.create(user_params)
  	unless @user.errors.any?
  	  session[:id] = @user.id
  	  redirect_to '/songs'
  	else
  	  flash[:errors] = @user.errors.full_messages
  	  redirect_to '/'
  		
  	end
  end

  private
	def user_params
		params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
	end

end
