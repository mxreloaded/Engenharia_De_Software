module Api 
    module V1
        class UsersController < BaseController
            skip_before_action :authenticate_request, only: [:create]
            before_action :set_user, only: [:show, :destroy, :update]
            
            #get all
            def index
                @users = User.all
                render json: @users, status: :ok
            end

            #get
            def show
                render json: @user, status: :ok
            end

            #post
            def create
                @user = User.new(user_params)
                if @user.save
                    render json: @user, status: :created
                else
                    render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
                end
            end

            #put
            def update
                unless @user.update(user_params)
                    render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
                end
            end
            #delete
            def destroy
                @user.destroy
            end
            
            private
            def user_params
                params.permit(:name, :email, :password)
            end

            def set_user
                @user = User.find(params[:id])
            end
        end
    end
end