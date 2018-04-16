class CommentsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "comments_#{params[:product_id]}"
  end
end
