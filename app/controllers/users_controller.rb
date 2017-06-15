class UsersController < ApplicationController
  def index
    @users = User.all
  end

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
  	@user = User.find(params[:id])
    @attending_events = @user.attending_events
    @upcoming_events = @user.upcoming_events
    @past_events = @user.past_events
  end

  def invite
    user  = params[:user_id]
    event = params[:event_id]
    invite = create_invitation(user,event)

    if invite.save
      flash[:success] = "Invitation sent!"
      redirect_to current_user
    else
      flash[:warning] = "Something went wrong..."
    end
  end

  private
  	def user_params
  		params.require(:user).permit(:name)
  	end

    def create_invitation(user,event)
      invite = EventAttendance.new(event_attended_id: event, attendee_id: user)
    end
end
