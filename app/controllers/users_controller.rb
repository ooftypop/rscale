class UsersController < ApplicationController
  def index
    User.all
  end

  def show
    if user_signed_in?
      @user = current_user
    else
      redirect_to sign_in_path
    end
  end
end
