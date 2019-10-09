class GroupsController < ApplicationController

  before_action :set_group, except: [:index]

  def index
    @groups = Group.all
  end

  def show
  end

  def new
    @group.build_user
  end

  def create
    @group.assign_attributes(group_params)
    if @group.save
      flash[:success] = "#{@group.id}"
      redirect_to group_path(@group)
    else
      render "new"
    end
  end

  def edit
  end

  def update
    if @group.update(group_params)
      flash[:success] = "You have created a group!"
      redirect_to group_path(@group)
    else
      alert[:danger] = "Group unable to be updated."
    end
  end

  def destroy
    @group.destroy
    flash[:success] = "Group removed"
    redirect_to root_url
  end

  def edit_user_emails
    render 'form.js'
  end

  def edit_users_group
    puts "BOOGERS"
  end

  private

  def set_group
    @group = params[:id].present? ? Group.find(params[:id]) : current_user.groups.new
  end

  def group_params
    params.require(:group).permit(
      :description,
      :title,
      :user_id,
      users_attributes: [:user_id, :email]
    )
  end
end
