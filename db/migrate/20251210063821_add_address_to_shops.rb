class AddAddressToShops < ActiveRecord::Migration[8.0]
  def change
    add_column :shops, :address, :string
  end
end
