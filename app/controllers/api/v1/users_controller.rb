class API::V1::UsersController < ApplicationController
    before_action :set_user, only: %i[show update destroy]

    def create
      @user = User.create!(user_params)
      if @user
        render json: UserSerializer.new(@user).serializable_hash[:data][:attributes], status: :created
      end
    end

    def update
      @user = User.find(params[:id])
      if @user.update(user_params)
        render json: UserSerializer.new(@user).serializable_hash[:data][:attributes], status: :ok
      else
        render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
      end
    end

  private

  def user_params
    params.permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])

    if @user.nil?
      return render json: { errors: ['You need to sign in or sign up before continuing.'] },
                    status: :unauthorized
    end

    @user
  end
end
