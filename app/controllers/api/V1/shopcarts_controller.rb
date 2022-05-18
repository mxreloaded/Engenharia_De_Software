module Api 
  module V1
    class ShopcartsController < BaseController
      before_action :set_shopcart, only: [:show, :destroy, :update]

      def show
        render json: Api::V1::ShopcartSerializer.call(@shopcart), status: :ok 
      end

      def index
        @shopcarts = current_user.shopcarts.map { |shopcart| Api::V1::ShopcartSerializer.call(shopcart) }

        render json: @shopcarts, status: :ok
      end

      def create
        name = params[:name] if params[:name].present?
        shopcart = Shopcart.create(name: name)
        shopcart.users << current_user
        shopcart.save

        render :json => Api::V1::ShopcartSerializer.call(shopcart)
      end

      def update
        unless @shopcart.update(shopcart_params)
          return render json: { errors: @shopcart.errors.full_messages }, status: :unprocessable_entity
        end
        
        unless @shopcart.users.include?(current_user)
          return render json: { errors: "Você não participa desse carrinho :(" }, status: :unprocessable_entity
        end

        @shopcart.update(user_params)

        render json: Api::V1::ShopcartSerializer.call(@shopcart), status: :ok
      end

      private

      def shopcart_params
        params.permit(:name, :users, :user_ids, :product_ids)
      end

      def set_shopcart
        @shopcart = Shopcart.find(params[:id])
      end
    end
  end
end
