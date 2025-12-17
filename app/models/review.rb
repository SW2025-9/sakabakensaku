class Review < ApplicationRecord
    belongs_to :user
    
    belongs_to :shop, optional: true
    belongs_to :item, optional: true
    
    validates :content, presence: true
end
