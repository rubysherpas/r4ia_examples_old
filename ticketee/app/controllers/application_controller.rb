class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def current_user
    @current_user ||= env['warden'].user
  end
  helper_method :current_user

  def signed_in?
    env["warden"].authenticated?
  end
  helper_method :signed_in?

  def require_sign_in!
    unless current_user.present?
      message = "You need to sign in or sign up before continuing."
      flash[:warning] = message
      redirect_to sign_in_url
    end
  end

  def authorize_admin!
   require_sign_in!

   unless current_user.admin?
     flash[:alert] = "You must be an admin to do that."
     redirect_to root_path
   end
  end
end
