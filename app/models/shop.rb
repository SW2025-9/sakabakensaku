class Shop < ApplicationRecord
<<<<<<< Updated upstream
    has_one_attached :image

  belongs_to :user, optional: true   # マイグレーションで user_id を必須にするなら optional: false に
  has_one_attached :image  # ActiveStorage を使うなら
=======
  belongs_to :user, optional: true   # ユーザ必須にしたいなら optional: false
  has_one_attached :image
>>>>>>> Stashed changes
  validates :name, presence: true

end
