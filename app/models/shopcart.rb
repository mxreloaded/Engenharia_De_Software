class Shopcart < ApplicationRecord
    has_many :shopcarts_users
    has_many :users, through: :shopcarts_users
end
