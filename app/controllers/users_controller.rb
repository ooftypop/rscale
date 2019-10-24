class UsersController < ApplicationController

  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    if user_signed_in?
      @user_polls = Poll.with_roles([:resource_admin, :user], current_user)
    else
      redirect_to sign_in_path
    end
  end
end
