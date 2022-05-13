module Api 
    module V1
        class BaseController < ApplicationController
            before_action :current_user

            def current_user
                return nil if request.authorization.nil?
                
                User.find(jwt_decode(request.authorization)[:user_id])
            end
           
        end
    end
end
