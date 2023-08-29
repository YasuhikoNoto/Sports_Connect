class Admin::CommentsController < ApplicationController
before_action :authenticate_admin!
  def index
    @comments = Comment.all
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to admin_comments_path
  end

  def member
    @member = Member.find(params[:id])
    @posts = Post.all.order(updated_at: :desc,reated_at: :desc).page(params[:page]).per(10)
  end

end
