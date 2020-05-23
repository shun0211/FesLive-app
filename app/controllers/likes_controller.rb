class LikesController < ApplicationController
  def create
    @like = Like.create(set_list_id: params[:set_list_id], user_id: current_user.id)
    redirect_to :back
  end

  def destroy
    @like = Like.find_by(user_id: current_user.id, set_list_id: params[:set_list_id])
    @like.destroy
    redirect_to :back
  end
end
