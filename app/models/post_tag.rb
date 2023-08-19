class PostTag < ApplicationRecord

  belongs_to :tag
  belongs_to :post, optional: true
  #optional: trueで外部キーのnilを許可する タグ付けせずに投稿することを考慮

end
