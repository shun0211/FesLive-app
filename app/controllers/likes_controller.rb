class LikesController < ApplicationController
  def create
    @like = Like.create(set_list_id: params[:set_list_id], user_id: current_user.id)
  end

  def destroy
    @like = Like.find_by(user_id: current_user.id, set_list_id: params[:set_list_id])
    @like.destroy
  end
end
