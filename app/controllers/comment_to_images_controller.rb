class CommentToImagesController < ApplicationController
  def create
    @comment = CommentToImage.new(comment_params)
    @comment.user_id = current_user.id
    respond_to do |format|
      if @comment.save
        format.html { redirect_to :back }
        # format.jsonの記述により、views/comment_to_images/create.json.jbuilderが読まれる
        format.json
      end
    end
  end

  def destroy
    @comment = CommentToImage.find(params[:id])
    respond_to do |format|
      format.json { render json: @comment.id }
    end
  end

  private
  def comment_params
    params.require(:comment_to_image).permit(:content, :image_id)
  end

end
