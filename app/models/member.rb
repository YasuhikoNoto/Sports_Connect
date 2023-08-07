class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy

  validates :email, presence: true
  validates :name, presence: true
  validates :is_deleted, presence: true
  #半角数字のみ許可するバリデーション
  validates :phone_number, format: { with: /\A[0-9]+\z/}

  has_one_attached :member_image

  def get_member_image
    (member_image.attached?) ? member_image : 'no_image.jpg'
  end

#画像関係の処理 後回し
#  def get_member_image(width, height)
#    unless member_image.attached?
#      file_path = Rails.root.join('app/assets/images/no_image.jpg')
#      member_image.attach(io: File.open(file_path), filename: 'no_image.jpg', content_type: 'image/jpeg')
#    else
#      member_image.variant(resize_to_limit: [width, height]).processed
#    end
#  end

end
