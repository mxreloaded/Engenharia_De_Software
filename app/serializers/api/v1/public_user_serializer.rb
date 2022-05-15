# frozen_string_literal: true

module Api
  module V1
    class PublicUserSerializer < Api::V1::BaseSerializer
      def self.call(object)
        self.default_serializer(
          object,
          %i[id name]
        )
      end
    end
  end
end
