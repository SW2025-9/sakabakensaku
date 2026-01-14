class ChangeShopIdNullableInLikes < ActiveRecord::Migration[7.0]
  def change
    # shop_id に NULL（空）が入ることを許可する
    change_column_null :likes, :shop_id, true
    
    # item_id に NULL（空）が入ることを許可する
    change_column_null :likes, :item_id, true
  end
end