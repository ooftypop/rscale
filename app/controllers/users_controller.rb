class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    if user_signed_in?
      @user_founder_forums     = Forum.with_role(:founder, current_user)
      @user_moderator_forums   = Forum.with_role(:moderator, current_user)
      @user_participant_forums = Forum.with_role(:participant, current_user)
    else
      redirect_to sign_in_path
    end
  end
end
