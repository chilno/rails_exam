class SessionsController < ApplicationController
  def new
  end

  def create
  	@user = User.find_by(email: params[:email])
  	if @user and @user.authenticate(params[:password])
  	  session[:id] = @user.id
  	  redirect_to "/songs"
  	else
  	  flash[:errors] = ["Username or Password is Invalid"]
  	  redirect_to '/'
  	end
  end

  def destroy
  	session.clear
  	redirect_to '/'
  end
end
