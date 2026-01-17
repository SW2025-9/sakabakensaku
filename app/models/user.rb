class User < ApplicationRecord
  has_secure_password

  has_many :shops, dependent: :nullify
  
  validates :uid, presence: true, uniqueness: true
  
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