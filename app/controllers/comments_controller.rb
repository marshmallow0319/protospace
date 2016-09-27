class CommentsController < ApplicationController
  def create
    Comment.create(comment_params)
    @comment = Comment.new
    @comments = Comment.where(prototype_id: params[:prototype_id])
    @prototype = Prototype.find(params[:prototype_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:id, :content).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end
end
