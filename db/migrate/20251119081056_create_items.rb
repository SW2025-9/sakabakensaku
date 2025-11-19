class CreateItems < ActiveRecord::Migration[8.0]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :liter
      t.integer :price
      t.category :string
      t.string :detail

      t.timestamps
    end
  end
end
