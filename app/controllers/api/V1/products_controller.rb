module Api 
  module V1
    class ProductsController < BaseController       
      def index
        @products = Product.all.map {|product| Api::V1::ProductSerializer.call(product)}

        render json: @products, status: :ok
      end   

      def create
          name = params[:name] if params[:name].present?
          price = params[:price] if params[:price].present?
          category_id = params[:category_id] if params[:category_id].present?

          product = Product.create(name: name, price: price, category_id: category_id, user_id: current_user.id)
          product.save

          render :json => Api::V1::ProductSerializer.call(product)
      end 
    end
  end
end
