class User < ApplicationRecord
  has_secure_password
  has_many :shops, dependent: :nullify
  validates :uid, presence: true, uniqueness: true
  
  has_many :likes, dependent: :destroy
  has_many :liked_shops, through: :likes, source: :shop

  def already_liked?(shop)
    self.likes.exists?(shop_id: shop.id)
  end
end
