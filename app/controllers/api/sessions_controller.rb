class Api::SessionsController < ApplicationController
  skip_before_action :require_login, except: [:destroy]

  def new
  end

  def create
    user = User.authenticate(params[:email], params[:password]) # This method comes from Sorcery
    if user
      token = Jwt::TokenProvider.(user_id: user.id)
      render json: {user: user, token: token, status: true} #  As an extra security metric, you might want to make sure you don’t send user’s encrypted password in `user: user` ;)
    else
      render json: {error: 'Error description', status: false}
    end
  end

  def destroy
    logout
    flash[:success] = 'See you!'
    redirect_to log_in_path
  end
end
