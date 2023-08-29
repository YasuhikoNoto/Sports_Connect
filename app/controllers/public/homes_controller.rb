class Public::HomesController < ApplicationController
  def top
    @posts = Post.all.order(updated_at: :desc, created_at: :desc).page(params[:page]).per(5)
    @q = Post.ransack(params[:q])
    # @posts_search = @q.result(distinct: true)
    # @result = params[:q]&.values&.reject(&:blank?)
  end

  def search
  end
end
