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
          **products_shopcart_values(object.id, shopcart_id)
        )
      end

      private

      def self.quantity(product_id, shopcart_id)
        shopcart_id.present? ? { quantity: ProductsShopcart.where(product_id: product_id, shopcart_id: shopcart_id).first.quantity } : {}
      end

      def self.products_shopcart_values(product_id, shopcart_id)
        product_shopcart = ProductsShopcart.where(product_id: product_id, shopcart_id: shopcart_id).first

        shopcart_id.present? ? { productsShopcartId: product_shopcart&.id, promoValue: product_shopcart&.promo_value, promoQuantity: product_shopcart&.promo_quantity,  } : {}
      end
    end
  end
end
