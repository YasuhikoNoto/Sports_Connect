class Post < ApplicationRecord

  has_many :comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :post_tags, dependent: :destroy, foreign_key: 'post_id'
  has_many :tags, through: :post_tags
  belongs_to :member

  validates :title, presence: true
  validates :body, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ["body", "created_at", "id", "is_opened", "member_id", "title", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["bookmarks", "comments", "member", "post_tags", "tags"]
  end

  def bookmarked_by?(member)
    bookmarks.where(member_id: member).exists?
  end
  
end
