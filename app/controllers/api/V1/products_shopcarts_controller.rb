module Api 
  module V1
    class ProductsShopcartsController < BaseController
      before_action :set_product_shopcart, only: [:destroy, :update]

      def update
        promo_value = params[:promo_value] if params[:promo_value].present?
        promo_quantity = params[:promo_quantity] if params[:promo_quantity].present?
        if params[:quantity].present?
          quantity = params[:quantity] 
        else
          quantity = 1
        end

        @products_shopcart.update(quantity: quantity, promo_value: promo_value, promo_quantity: promo_quantity)

        render :json => Api::V1::ProductsShopcartSerializer.call(@products_shopcart)
      end

      def create
        product_id = params[:product_id] if params[:product_id].present?
        shopcart_id = params[:shopcart_id] if params[:shopcart_id].present?
        promo_value = params[:promo_value] if params[:promo_value].present?
        promo_quantity = params[:promo_quantity] if params[:promo_quantity].present?
        if params[:quantity].present?
          quantity = params[:quantity] 
        else
          quantity = 1
        end

        unless Product.find(product_id).present?
          return render json: { errors: "Produto não existe :(" }, status: :unprocessable_entity
        end

        unless Shopcart.find(shopcart_id).present?
          return render json: { errors: "Carrinho não existe :(" }, status: :unprocessable_entity
        end

        unless Shopcart.find(shopcart_id).users.include?(current_user)
          return render json: { errors: "Você não participa desse carrinho :(" }, status: :unprocessable_entity
        end

        products_shopcart = ProductsShopcart.create(product_id: product_id, shopcart_id: shopcart_id, quantity: quantity, promo_value: promo_value, promo_quantity: promo_quantity )

        render :json => Api::V1::ProductsShopcartSerializer.call(products_shopcart)
      end

      def destroy
        @products_shopcart.destroy
      end

      private

      def set_product_shopcart
        @products_shopcart = ProductsShopcart.find(params[:id])
      end
    end
  end
end
