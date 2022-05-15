class AddQuantityToProductsShopcarts < ActiveRecord::Migration[7.0]
  def change
    add_column :products_shopcarts, :quantity, :integer, default: 1
  end
end
