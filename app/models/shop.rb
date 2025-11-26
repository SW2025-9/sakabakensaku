class Shop < ApplicationRecord
  has_one_attached :image
  has_many :items
  has_many :reviews
  has_many :likes
end
