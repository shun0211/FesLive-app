class ImageLikesController < ApplicationController
  def create
    @like = ImageLike.create(image_id: params[:image_id], user_id: current_user.id)
    @image = Image.find(params[:image_id])
  end

  def destroy
    @image = Image.find(params[:image_id])
    @like = ImageLike.find_by(user_id: current_user.id, image_id: params[:image_id])
    @like.destroy
  end
end
