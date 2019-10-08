class GroupsController < ApplicationController

  before_action :set_group, expect: [:index]

  def index
    @groups = Group.all
  end

  def show
  end

  def new
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

  private

  def set_group
    @group = params[:id].present? ? Group.find(params[:id]) : Group.new
  end

  def group_params
    params.require(:group).permit(
      :description,
      :title
    )
  end
end
