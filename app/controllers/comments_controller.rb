class CommentsController < ApplicationController
  
  def new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    respond_to do |format|
      if @comment.save
        format.html { redirect_to :back }
        format.json
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.json { render json: @comment.id }
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :set_list_id)
  end

end
