class EventsController < ApplicationController
  def index
    @events = Event.all
  end
  
  def choise_artist
    @set_lists = SetList.all
    @event = Event.find(params[:id])
  end
  
end
