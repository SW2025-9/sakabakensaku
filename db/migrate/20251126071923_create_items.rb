class CreateItems < ActiveRecord::Migration[8.0]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :liter
      t.integer :price
      t.string :category
      t.text :detail
      t.binary :image
      t.references :shop, null: false, foreign_key: true

      t.timestamps
    end
  end
end
