class Shop < ApplicationRecord
    has_one_attached :image

    belongs_to :user, optional: true   # マイグレーションで user_id を必須にするなら optional: false に
    has_one_attached :image  # ActiveStorage を使うなら
    validates :name, presence: true
    
    has_many :likes, dependent: :destroy
    has_many :liked_users, through: :likes, source: :user
end
