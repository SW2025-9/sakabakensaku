# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end

  # ログイン必須にする例
  def require_login
    return if logged_in?
    redirect_to login_path, alert: "ログインしてください"
  end
end
