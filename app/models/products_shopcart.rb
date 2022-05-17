class ProductsShopcart < ApplicationRecord
  belongs_to :product
  belongs_to :shopcart

  validates :product, presence: true
  validates :shopcart, presence: true
  validates_uniqueness_of :product, :scope => :shopcart

  scope :by_category, -> (category){ joins(product: [:category]).where(product: { category: category }) }
end
