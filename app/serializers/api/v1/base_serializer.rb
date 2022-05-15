# frozen_string_literal: true

module Api
  module V1
    class BaseSerializer
      def self.default_serializer(object, fields, serializer = {})
        fields.each { |field| serializer[field.to_s.camelize(:lower)] = object[field] }
        serializer
      end
    end
  end
end