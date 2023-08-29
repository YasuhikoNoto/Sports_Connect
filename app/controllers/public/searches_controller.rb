class Public::SearchesController < ApplicationController
  def search
    @q = Post.ransack(params[:q])
    @posts_search = @q.result(distinct: true).order(updated_at: :desc, created_at: :desc).page(params[:page]).per(10)
    @post_results = params[:q]&.values&.reject(&:blank?)

    #タグ検索
    @tag_ids = params[:tag_ids]&.select(&:present?)
    if @tag_ids.present?
      @tag_word = "タグ: "
      @tag_ids.each do |id|
        @tag_word = @tag_word + ' ' + Tag.find(id).item if id != ""
      end
    @tag_results = Post.joins(:post_tags).where(post_tags: {tag_id: @tag_ids}).group("posts.id").having("count(*) = #{@tag_ids.length}").order(updated_at: :desc, created_at: :desc).page(params[:page]).per(10)
    end
  end
end
