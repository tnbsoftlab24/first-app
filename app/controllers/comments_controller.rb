class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user

    if @comment.save
      ActionCable.server.broadcast "comments_#{comment_params[:product_id]}",
        body: @comment.body,
        created_at: @comment.created_at.strftime("%d %b, %r"),
        user_name: @comment.user.email
      head :ok
    else
      redirect_to product_path(comment_params[:product_id])
    end
  end

  private

  def comment_params
     params.require(:comment).permit(:body, :product_id)
   end

end
