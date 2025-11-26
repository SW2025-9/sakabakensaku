class Item < ApplicationRecord
  has_one_attached :image

  belongs_to :shop
  has_many :reviews
  has_many :likes

end
