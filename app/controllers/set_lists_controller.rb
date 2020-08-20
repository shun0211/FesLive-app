class SetListsController < ApplicationController

  before_action :set_parameter, only: ["show", "edit", "update", "destroy"]

  def new
    @set_list = SetList.new
    @event = Event.find(params[:event_id])
    gon.event = @event
  end

  def create
    binding.pry
    @set_list = SetList.new(set_list_params)
    @set_list.user_id = current_user.id
    respond_to do |format|
      if @set_list.valid?
        @set_list.save
        format.html { redirect_to root_path }
        format.json { render json: @set_list.errors.full_messages }
      else
        format.json { render json: @set_list.errors.full_messages }
      end
    end
  end

  def show
    @comment = Comment.new
    @comments = @set_list.comments
    gon.event = @event
    gon.set_list = @set_list
  end

  def destroy
    @set_list.destroy
    redirect_to choise_artist_event_path(@event)
  end

  def edit
    gon.set_list = @set_list
    gon.event = @event
  end

  def update
    respond_to do |format|
      if @set_list.update(set_list_params)
        @set_list.valid?
        format.html { redirect_to :back }
        format.json { render json: @set_list.errors.full_messages }
      else
        format.json { render json: @set_list.errors.full_messages }
      end
    end
  end

  def set_parameter
    @set_list = SetList.find(params[:id])
    @event = Event.find(params[:event_id])
  end

  private
  def set_list_params
    params.require(:set_list).permit(
      :event_id,
      :artist,
      :first_song,
      :second_song,
      :third_song,
      :fourth_song,
      :fifth_song,
      :sixth_song,
      :seventh_song,
      :eighth_song,
      :ninth_song,
      :tenth_song
    )
  end

end
