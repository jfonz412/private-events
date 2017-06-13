class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		flash[:success] = "Sign up successful"
      log_in(@user)
  		redirect_to @user
  	else
  		flash.now[:danger] = "Error...try again"
  		render 'new'
  	end
  end

  def show
  	@user = User.find_by(params[:id])
  end

  private
  	def user_params
  		params.require(:user).permit(:name)
  	end
end
