class Product < ApplicationRecord
  belongs_to :user
  
  has_many :products_shopcart
  has_many :shopcarts, through: :products_shopcart

  belongs_to :category, optional: true
end
