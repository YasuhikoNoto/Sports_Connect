class ApplicationController < ActionController::Base
#before_action :authenticate_admin!, if: :admin_url  adminでadminのアクセス制限をかけたいが、原因不明のエラーが発生
#暫定措置としてadminの各コントローラにて制限をかける
# before_action :search

#   def search
#     @q = Post.ransack(params[:q])
#     @posts_search = @q.result(distinct: true)
#     @result = params[:q]&.values&.reject(&:blank?)

#     #タグ検索
#     @tag_ids = params[:tag_ids]&.select(&:present?)
#     if @tag_ids.present?
#       @tag_word = "タグ: "
#       @tag_ids.each do |id|
#         @tag_word = @tag_word + ' ' + Tag.find(id).item if id != ""
#       end
#     @posts = @posts.joins(:post_tags).where(post_tags: {tag_id: @tag_ids}).group("posts.id").having("count(*) = #{@tag_ids.length}")
#     end

#     # 検索結果件数
#     @posts_count = @posts
#   end
end
