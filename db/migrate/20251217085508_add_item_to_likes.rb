class AddItemToLikes < ActiveRecord::Migration[8.0]
  def change
    add_reference :likes, :item, foreign_key: true
  end
end
