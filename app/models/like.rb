class Like < ApplicationRecord
  belongs_to :user
  
  belongs_to :shop, optional: true
  belongs_to :item, optional: true
  
  validates :user_id, uniqueness: { scope: :shop_id }
end
