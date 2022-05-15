class CreateProductsShopcarts < ActiveRecord::Migration[7.0]
  def change
    create_table :products_shopcarts do |t|
      t.references :shopcart, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
