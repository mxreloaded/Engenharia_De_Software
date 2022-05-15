module Api 
    module V1
        class CategoriesController < BaseController            
            def index
                @categories = Category.all.map {|category| Api::V1::CategorySerializer.call(category)}
                render json: @categories, status: :ok
            end
        end
    end
end
