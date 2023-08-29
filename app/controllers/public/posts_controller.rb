class Public::PostsController < ApplicationController
  def index
    @posts = Post.all.order(updated_at: :desc, created_at: :desc).page(params[:page]).per(10)
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
    unless @post.member.id == current_member.id
      redirect_to post_path(@post)
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path
    else
      flash[:update_failed] = "情報更新に失敗しました"
      render :edit
    end
  end

  def create
    @post = Post.new(post_params)
    @post.member_id = current_member.id
    if @post.save
      redirect_to post_path(@post)
    else
      flash[:test] = "投稿に失敗しました"
      redirect_to new_post_path
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  def member
    @member = Member.find(params[:id])
    @posts = @member.posts.all.order(updated_at: :desc, created_at: :desc).page(params[:page]).per(10)
  end

  def bookmarked
    @member = Member.find(params[:id])
    @posts = Post.all.order(updated_at: :desc, created_at: :desc).page(params[:page]).per(10)
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :member_id, :post_tag_id, :is_opened, tag_ids: [])
  end

end
