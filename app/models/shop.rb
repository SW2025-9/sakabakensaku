class Shop < ApplicationRecord
    has_one_attached :image
    
    has_many :likes, dependent: :destroy
    
    belongs_to :user, optional: true   # マイグレーションで user_id を必須にするなら optional: false に
    has_one_attached :image  # ActiveStorage を使うなら
    validates :name, presence: true
    
    has_many :reviews, dependent: :destroy
    
    has_many :items, dependent: :destroy
end
