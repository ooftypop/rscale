class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    if user_signed_in?
      @user_admin_polls = Poll.with_role(:resource_admin, current_user)
      @user_polls       = Poll.with_role(:user, current_user)
    else
      redirect_to sign_in_path
    end
  end
end
