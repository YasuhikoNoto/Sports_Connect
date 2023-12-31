class Public::CommentsController < ApplicationController
  def new
  end

  def create
    post = Post.find(params[:post_id])
    comment = current_member.comments.new(comment_params)
    comment.post_id = post.id
    comment.save
    redirect_to request.referer
  end

  def destroy
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end

end
