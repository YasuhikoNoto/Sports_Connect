class Admin::PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @tag = @post.tag
  end

  def edit
  end

  def update
  end

  def destroy
    @post = Post.destroy
  end

end
