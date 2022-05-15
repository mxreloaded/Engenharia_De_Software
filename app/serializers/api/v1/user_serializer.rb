# frozen_string_literal: true

module Api
  module V1
    class UserSerializer < Api::V1::BaseSerializer
      def self.call(object)
        self.default_serializer(
          object,
          %i[id name],
          shopcartIds: object.shopcart_ids,
        )
      end
    end
  end
end
