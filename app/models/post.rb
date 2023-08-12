class Post < ApplicationRecord

  has_many :comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :post_tags, dependent: :destroy, foreign_key: 'post_id'
  has_many :tags, through: :post_tags
  belongs_to :member

  validates :title, presence: true
  validates :body, presence: true
  validates :is_opened, presence: true

end
