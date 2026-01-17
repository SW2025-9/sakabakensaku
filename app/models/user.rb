class User < ApplicationRecord
  has_secure_password

  # 店舗の所有者情報
  has_many :shops, dependent: :nullify
  
  # ユーザー名の設定
  validates :uid, presence: true, uniqueness: true

  validates :password, length: { minimum: 4 }, allow_nil: true, allow_blank: true

  has_many :likes, dependent: :destroy
  has_many :liked_shops, through: :likes, source: :shop
  has_many :liked_items, through: :likes, source: :item
  
  def already_liked?(object)
    if object.is_a?(Shop)
      self.likes.exists?(shop_id: object.id)
    elsif object.is_a?(Item)
      self.likes.exists?(item_id: object.id)
    end
  end

end