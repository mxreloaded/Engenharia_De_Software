# frozen_string_literal: true

module Api
  module V1
    class ProductSerializer < Api::V1::BaseSerializer
      def self.call(object, shopcart_id = nil)
        self.default_serializer(
          object,
          %i[id name price],
          user: Api::V1::PublicUserSerializer.call(object.user),
          category: object&.category.present? ? Api::V1::CategorySerializer.call(object.category) : nil,
          **quantity(object.id, shopcart_id),
          **products_shopcart(object.id, shopcart_id)
        )
      end

      private

      def self.quantity(product_id, shopcart_id)
        shopcart_id.present? ? { quantity: ProductsShopcart.where(product_id: product_id, shopcart_id: shopcart_id).first.quantity } : {}
      end

      def self.products_shopcart(product_id, shopcart_id)
        shopcart_id.present? ? { productsShopcartId: ProductsShopcart.where(product_id: product_id, shopcart_id: shopcart_id).first.id } : {}
      end
    end
  end
end
