class User < ApplicationRecord
    require "securerandom"
    
    has_secure_password

    validates :email, presence: true, uniqueness: true
    validates :password, presence: true
    validates :name, presence: true
    has_many :shopcarts_users
    has_many :shopcarts, through: :shopcarts_users
end
