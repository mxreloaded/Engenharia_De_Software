class AuthenticationController < ApplicationController
    skip_before_action :authenticate_request

    #post
    def login  
        @user = User.find_by_email(params[:email])
        if @user&.authenticate(params[:password])
            token = jwt_encode(user_id: @user.id)
            render json: { token: token, user: Api::V1::UserSerializer.call(User.find(jwt_decode(token)[:user_id]))}, status: :ok
        else
            render json: { error: 'unauthorized' }, status: :unauthorized
        end
    end
end
