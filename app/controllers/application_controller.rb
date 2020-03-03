class ApplicationController < ActionController::API
  before_action :require_login

  def authenticate
    render json: {errors: 'Unauthorized'}, status: 401 unless current_user
  end

  def current_user
    @current_user ||= Jwt::UserAuthenticator.(request.headers)
  end

  private

  def not_authenticated
    flash[:warning] =
    render json: {errors: 'You have to authenticate to access this page.'}
  end
end
