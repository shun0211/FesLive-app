class SetListsController < ApplicationController

  def new
    @set_list = SetList.new
    @event = Event.find(params[:id])
    gon.event = @event
  end

  def create
    @set_list = SetList.new(set_list_params)
    binding.pry
    respond_to do |format|
      if @set_list.valid?
        @set_list.save
        format.html { redirect_to root_path }
        format.html { render json: @set_list.errors.full_messages }
      else
        format.json { render json: @set_list.errors.full_messages }
      end
    end
  end

  def show
  end

  private
  def set_list_params
    params.require(:set_list).permit(
      :event_id,
      :artist,
      :first_song,
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
