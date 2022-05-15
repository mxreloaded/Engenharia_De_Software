# frozen_string_literal: true

module Api
  module V1
    class ShopcartSerializer < Api::V1::BaseSerializer
      def self.call(object)
        self.default_serializer(
          object,
          %i[id name],
          users: object&.users.map { |user| Api::V1::PublicUserSerializer.call(user) },
          categories: object&.categories.map { |category| Api::V1::CategorySerializer.call(category) },
          products: object&.products.map { |product| Api::V1::ProductSerializer.call(product, object.id) },
        )
      end
    end
  end
end
