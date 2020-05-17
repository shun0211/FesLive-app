class SetListsController < ApplicationController

  def new
    @set_list = SetList.new
    @event = Event.find(params[:id])
  end

  def create
  end

  def show
  end
end
