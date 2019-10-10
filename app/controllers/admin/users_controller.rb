class Admin::UsersController < Admin::AdminController

  before_action :set_user, except: [:index]

  def index
    @users = User.all
    authorize :admin, :index?
  end

  def show
    authorize :admin, :show?
  end

  def edit
    authorize :admin, :edit?
  end

  def update
    authorize :admin, :update?
  end

  def remove_role_link( options = {  })
    user = User.find(params[:user_id])
    poll = Poll.find(params[:resource_id])
    name = params[:name].to_sym
    user.remove_role(name, poll)
    redirect_back(fallback_location: root_path)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

end
