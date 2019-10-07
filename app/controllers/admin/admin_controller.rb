class Admin::AdminController < ApplicationController

  def index
    @polls = Poll.all
    @users = User.all
  end

  def users_index
  end

  def polls_index
  end
end
