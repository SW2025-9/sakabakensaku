class CreateReviews < ActiveRecord::Migration[8.0]
  def change
    create_table :reviews do |t|
      t.text :content
      t.references :shop, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :item, foreign_key: true

      t.timestamps
    end
  end
end
