# frozen_string_literal: true

module Api
  module V1
    class ProductsShopcartSerializer < Api::V1::BaseSerializer
      def self.call(object, shopcart_id = nil)
        self.default_serializer(
          object,
          %i[id product_id shopcart_id quantity promo_quantity promo_value]
        )
      end
    end
  end
end
