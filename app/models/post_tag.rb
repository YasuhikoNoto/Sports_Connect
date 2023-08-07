class PostTag < ApplicationRecord

  belongs_to :tags
  belongs_to :post

end
