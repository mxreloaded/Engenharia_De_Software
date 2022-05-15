class AddFieldsToProductsShopcarts < ActiveRecord::Migration[7.0]
  def change
    add_column :products_shopcarts, :promo_quantity, :integer
    add_column :products_shopcarts, :promo_value, :decimal, precision: 8, :scale => 2
  end
end
