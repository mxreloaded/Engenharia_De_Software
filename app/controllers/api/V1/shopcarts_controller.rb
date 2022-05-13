module Api 
    module V1
        class ShopcartsController < BaseController            
            def create
                name = params[:name] if params[:name].present?
                shopcart = Shopcart.create(name: name)
                shopcart.users << current_user
                shopcart.save
                
                render :json => shopcart
            end 
        end
    end
end
