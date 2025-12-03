class CreateShops < ActiveRecord::Migration[8.0]
  def change
    create_table :shops do |t|
      t.string :name
      t.binary :image
      t.string :city
      t.string :detail

      t.timestamps
    end
  end
end
