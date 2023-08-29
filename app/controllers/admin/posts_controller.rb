class Admin::PostsController < ApplicationController
before_action :authenticate_admin!
  def index
    @posts = Post.all.order(updated_at: :desc, created_at: :desc).page(params[:page]).per(10)
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to admin_posts_path
  end

  def member
    @member = Member.find(params[:id])
    @posts = @member.posts.all.order(updated_at: :desc, created_at: :desc).page(params[:page]).per(10)
  end


end
