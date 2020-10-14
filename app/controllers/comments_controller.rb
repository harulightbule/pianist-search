class CommentsController < ApplicationController
  def create
    comment = Comment.create(comment_params)
    redirect_to  "/pianists/#{comment.pianist.id}" 
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, pianist_id: params[:pianist_id])
  end
end
