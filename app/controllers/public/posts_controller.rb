class Public::PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path
    else
      render :edit
    end
  end

  def create
    @post = Post.new(post_params)
    @post.member_id = current_member.id
    if @post.save
      redirect_to new_post_path
    else
      flash[:test] = "失敗"
      redirect_to new_post_path
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :member_id, :post_tag_id, tag_ids: [])
  end

end
