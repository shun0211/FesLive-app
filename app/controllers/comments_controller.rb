class CommentsController < ApplicationController
  
  def new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.set_list_id = params[:set_list_id]
    respond_to do |format|
      if @comment.save
        format.html { redirect_to :back }
        format.json
      end
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end

end
