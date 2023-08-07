class Public::PostsController < ApplicationController
  def index
  end

  def new
    @post = Post.new
  end

  def show
  end

  def update
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to post_path
    else
      flash[:test] = "test"
      redirect_to new_post_path
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

end
