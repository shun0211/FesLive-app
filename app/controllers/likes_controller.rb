class LikesController < ApplicationController
  def create
    @like = Like.create(set_list_id: params[:set_list_id], user_id: current_user.id)
    @set_list = SetList.find(params[:set_list_id])
    @event = Event.find(params[:event_id])
  end

  def destroy
    @like = Like.find_by(user_id: current_user.id, set_list_id: params[:set_list_id])
    @set_list = SetList.find(params[:set_list_id])
    @event = Event.find(params[:event_id])
    @like.destroy
  end

end
