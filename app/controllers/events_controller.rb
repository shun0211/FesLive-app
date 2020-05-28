class EventsController < ApplicationController
  def index
    @events = Event.all
  end
  
  def choise_artist
    @event = Event.find(params[:id])
    @set_lists = @event.set_lists
  end
  
end
