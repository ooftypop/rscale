class Admin::UsersController < Admin::AdminController

  def index
    @users = User.all
    authorize :admin, :index?
  end

  def show
    @user = User.find_by(id: params[:id])
    authorize :admin, :show?
  end

  def remove_role_link( options = {  })
    user = User.find(params[:user_id])
    poll = Poll.find(params[:resource_id])
    name = params[:name].to_sym
    user.remove_role(name, poll)
    redirect_to root_path
  end

  private

end
