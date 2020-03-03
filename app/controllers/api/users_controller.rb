class Api::UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)

    if user.save
      token = Jwt::TokenProvider.(user_id: user.id)

      render json: {user: user, token: token}
    else
      render json: { error: user.errors }, status: 200
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :user_name)
  end
end
