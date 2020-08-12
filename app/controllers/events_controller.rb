class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def choise_artist
    @event = Event.find(params[:id])
    @set_lists = @event.set_lists
  end
  def event_image
    @event = Event.find(params[:id])
    @images = @event.images.page(params[:page]).per(4)
  end

end
