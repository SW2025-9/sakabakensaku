class User < ApplicationRecord
  has_secure_password
  has_many :shops, dependent: :nullify
  validates :uid, presence: true, uniqueness: true
end
