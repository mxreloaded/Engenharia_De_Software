class CreateShopcartsUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :shopcarts_users do |t|
      t.references :user, null: false, foreign_key: true
      t.references :shopcart, null: false, foreign_key: true

      t.timestamps
    end
  end
end
