class EventsController < ApplicationController
  def new
  	@event = Event.new()
  end

  def create
  	@event = current_user.events.build(event_params)
  	if @event.save
  		flash[:success] = "Event created!"
  		redirect_to current_user
  	else
  		flash.now[:danger] = "Unable to create event"
  		render 'new'
  	end
  end

  def show
  	@event = Event.find_by(id: params[:id])
  end

  def index
  	@events = Event.all
  end

  private
  	def event_params
  		params.require(:event).permit(:title, :description, :location, :date)
  	end
end
