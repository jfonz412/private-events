class EventsController < ApplicationController
  def new
  	@event = Event.new
  end

  def create
  	@event = current_user.events.build(event_params)
  	if @event.save
  		flash[:success] = "Event created!"
  		redirect_to @event
  	else
  		flash[:danger] = "There was an error in your event posting..."
  		render 'new'
  	end
  end

  def show
  	@event = Event.find(params[:id])
    @attendees = @event.attendees
  end

  def index
    @upcoming_events = Event.upcoming
    @past_events = Event.past
  end

  private
  	def event_params
  		params.require(:event).permit(:name, :description, :date)
  	end
end
