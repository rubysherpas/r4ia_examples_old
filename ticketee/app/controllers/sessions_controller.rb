class SessionsController < ApplicationController
  def create
    if env['warden'].authenticate
      flash[:notice] = "Signed in successfully."

      redirect_to root_url
    else
      flash[:alert] = "Invalid email or password."
      render :new
    end
  end
end
