class ApplicationController < ActionController::Base
  include Pundit

  protect_from_forgery prepend: true

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to root_path 
  end
end
