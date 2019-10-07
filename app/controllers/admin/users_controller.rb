class Admin::UsersController < Admin::AdminController

  def index
    @users = User.all
    authorize :admin, :index?
  end

  def show
    @user = User.find_by(id: params[:id])
    authorize :admin, :show?
  end

  private

end
