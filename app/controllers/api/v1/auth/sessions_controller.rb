class API::V1::Auth::SessionsController < ApplicationController
    def login
      user = User.find_by(email: user_params[:email])

      if user&.authenticate(user_params[:password])
        render json: { token: user.token }, status: :ok
      else
        render json: { errors: ['Invalid Email/Password'] }, status: :unauthorized
      end
    end

    private

    def user_params
      params.permit(:email, :password)
    end
  end
