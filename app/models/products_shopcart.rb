class ProductsShopcart < ApplicationRecord
  belongs_to :product
  belongs_to :shopcart

  validates :product, presence: true
  validates :shopcart, presence: true
  validates_uniqueness_of :product, :scope => :shopcart
end
