class Like < ApplicationRecord
  belongs_to :user
  
  belongs_to :shop, optional: true
  belongs_to :item, optional: true
  
  # item_idが存在する場合のみ、user_idとitem_idの組み合わせを一意にする
  validates :user_id, uniqueness: { scope: :item_id }, if: :item_id?
  # shop_idが存在する場合のみ、user_idとshop_idの組み合わせを一意にする
  validates :user_id, uniqueness: { scope: :shop_id }, if: :shop_id?
end
