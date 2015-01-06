class Admin::BaseController < ApplicationController
  before_action :authorize_admin!

  def index
  end

  private

  def authorize_admin!
    authenticate_user!

    unless current_user.admin?
      flash[:alert] = "You must be an admin to do that."
      redirect_to root_path
    end
  end
end
