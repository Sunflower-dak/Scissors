class API::V1::UsersController < ApplicationController
    before_action :set_user, only: %i[show update destroy]

  def index
    @users = User.all
    render json: {
      'users': @users,
    }, status: :ok
  end

  def show
    render json: UserSerializer.new(@user).serialized_json, status: :ok
  end

  def create
    @user = User.create!(user_params)

    render json: UserSerializer.new(@user).serialized_json, status: :created
  end

  def update
    @user.update!(user_params)

    render json: UserSerializer.new(@user).serialized_json, status: :ok
  end

  def destroy
    @user.destroy!(params[:id])

    head :no_content
  end

  private

  def user_params
    return params.permit(:first_name, :last_name, :email, :phone) if action_name == 'update'

    params.permit(:first_name, :last_name, :email, :phone, :password, :password_confirmation)
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
