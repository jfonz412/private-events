class SessionsController < ApplicationController
  def new
  end

  def create
  	@user = User.find_by(name: params[:session][:name]) # no need to whitelist apparently
  	if @user
  		#flash.now[:success] = "Logged in successfully"
  		log_in(@user)
  		redirect_to @user
  	else
  		flash.now[:danger] = "Error..."
  		render 'new'
  	end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to root_url
  end	
end
