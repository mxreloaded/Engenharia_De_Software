class ShopcartsUser < ApplicationRecord
  belongs_to :shopcart
  belongs_to :user
end
