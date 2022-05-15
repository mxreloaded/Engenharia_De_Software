module Api 
  module V1
    class BaseController < ApplicationController
      before_action :current_user

      rescue_from ActiveRecord::RecordNotFound do
        render(json: { errors: 'O que você buscou aew não existe ;)' }, status: :not_found)
      end

      rescue_from JWT::DecodeError do
        render(json: { errors: 'O seu token tá certo não ;)' }, status: :not_found)
      end

      rescue_from ActiveRecord::RecordInvalid do
        render(
          json: { errors: 'Problemas com os parâmetros provavelemente ;)' },
          status: :unprocessable_entity
        )
      end

      def current_user
        return nil if request.authorization.nil?

        User.find(jwt_decode(request.authorization)[:user_id])
      end
    end
  end
end
