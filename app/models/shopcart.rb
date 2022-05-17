class Shopcart < ApplicationRecord
  has_many :shopcarts_users
  has_many :users, through: :shopcarts_users

  has_many :products_shopcarts
  has_many :products, through: :products_shopcarts

  has_many :categories, through: :products

  scope :from_this_year, ->{ where("shopcarts.created_at > ?", Time.now.beginning_of_year) }
end
