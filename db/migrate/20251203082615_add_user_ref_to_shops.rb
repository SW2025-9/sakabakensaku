class AddUserRefToShops < ActiveRecord::Migration[8.0]
  def change
    add_reference :shops, :user, null: false, foreign_key: true
  end
end
