class LikesController < ApplicationController

  def index
  end

  def create
    @comment = Comment.find(params[:comment_id])
    @comment.likes.create
    render json: {new_like_count: @comment.likes.count}
    # redirect_to post_path
  end

end
