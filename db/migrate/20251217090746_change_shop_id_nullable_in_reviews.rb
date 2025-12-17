class ChangeShopIdNullableInReviews < ActiveRecord::Migration[8.0]
  def change
    change_column_null :reviews, :shop_id, true
  end
end
