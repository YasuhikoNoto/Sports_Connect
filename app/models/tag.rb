class Tag < ApplicationRecord

  has_many :post_tags, dependent: :destroy

  validates :category, presence: true
  validates :item, presence: true

end
