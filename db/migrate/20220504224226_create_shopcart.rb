class CreateShopcart < ActiveRecord::Migration[7.0]
  def change
    create_table :shopcarts do |t|
      t.string :name

      t.timestamps
    end
  end
end
