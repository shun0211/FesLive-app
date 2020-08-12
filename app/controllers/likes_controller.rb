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

  def image_like_create
    @image = Image.find(params[:image_id])
    if Like.exists?(user_id: current_user.id, image_id: params[:image_id])
      @like = Like.find_by(user_id: current_user.id)
      @like.update(image_id: params[:image_id])
    else
      binding.pry
      @like = Like.create(image_id: params[:image_id], user_id: current_user.id)
    end
  end

  def image_like_destroy
    @image = Image.find(params[:image_id])
    @like = Like.find_by(user_id: current_user.id, image_id: params[:image_id])
    @like.destroy
  end

end
