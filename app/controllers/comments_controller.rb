class CommentsController < ApplicationController
  
  def new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.set_list_id = params[:set_list_id]
    if @comment.save
      redirect_to :back
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end

end
