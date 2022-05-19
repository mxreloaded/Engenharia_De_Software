# frozen_string_literal: true

module Api
  module V1
    class UserSerializer < Api::V1::BaseSerializer
      def self.call(object)
        self.default_serializer(
          object,
          %i[id name],
          shopcartIds: object.shopcart_ids,
          spentThisYear: spent_this_year(object),
          spentThisYearByCategory: spent_this_year_by_category(object)
        )
      end

      def self.spent_this_year_by_category(user)
        Category.all.map do |category|
          total = 0
          user.shopcarts.from_this_year.each do |shopcart|
            shopcart.products_shopcarts.by_category(category).each do |product_shopcart|
              quantity = product_shopcart.quantity ? 0 : product_shopcart.quantity
              promo_quantity = product_shopcart.promo_quantity.nil? ? 0 : product_shopcart.promo_quantity
              price = product_shopcart.product.price.nil? ? 0 : product_shopcart.product.price 
              promo_value = product_shopcart.promo_value.nil? ? 0 : product_shopcart.promo_value
              value = 0
              if quantity > promo_quantity
                value = quantity * price
              else
                value = quantity * promo_value
              end
              total = total + value
            end
          end

          { name: category.name, spentThisYear: total.to_f.round(2) }
        end
      end

      def self.spent_this_year(user)
        total = 0
        user.shopcarts.from_this_year.each do |shopcart|
          shopcart.products_shopcarts.each do |product_shopcart|
            quantity = product_shopcart.quantity.nil? ? 0 : product_shopcart.quantity
            promo_quantity = product_shopcart.promo_quantity.nil? ? 0 : product_shopcart.promo_quantity
            price = product_shopcart.product.price.nil? ? 0 : product_shopcart.product.price 
            promo_value = product_shopcart.promo_value.nil? ? 0 : product_shopcart.promo_value
            value = 0
            if quantity > promo_quantity 
              value = quantity * price
            else
              value = quantity * promo_value
            end
            total = total + value
          end
        end

        total.to_f.round(2)
      end
    end
  end
end
