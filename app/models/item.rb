class Item < ApplicationRecord
  has_one_attached :image

  belongs_to :shop, optional: true   
  has_many :reviews, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :name, presence: true
end
