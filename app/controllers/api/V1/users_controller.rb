module Api 
  module V1
    class UsersController < BaseController
      skip_before_action :authenticate_request, only: [:create]
      before_action :set_user, only: [:show, :destroy, :update]
      
      def index
        @users = User.all.map { |public_user| Api::V1::PublicUserSerializer.call(public_user)}

        render json: @users, status: :ok
      end

      def show
        if @user.id == current_user.id
          return render json: Api::V1::UserSerializer.call(@user), status: :ok
        end

        render json: Api::V1::PublicUserSerializer.call(@user), status: :ok
      end

      def create
        @user = User.new(user_params)
        if @user.save
            render json: Api::V1::UserSerializer.call(@user), status: :created
        else
            render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
        if @user.id != current_user.id
          return render json: {errors: "Você só pode alterar sua conta :P"}, status: :ok
        end

        unless @user.update(user_params)
            render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
        end

        render json: Api::V1::UserSerializer.call(@user), status: :created
      end

      def destroy
        @user.destroy
      end
      
      private

      def user_params
        params.permit(:name, :email, :password, :shopcart_ids)
      end

      def set_user
        @user = User.find(params[:id])
      end
    end
  end
end