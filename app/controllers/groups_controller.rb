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
      flash[:notice] = "Group Created!"
      redirect_to group_path(@group)
    else
      flash[:alert] = "Group not created."
      render "new"
    end
  end

  def edit
  end

  def update
    if @group.update(group_params)
      flash[:notice] = "You have created a group!"
      redirect_to group_path(@group)
    else
      flash[:alert] = "Group unable to be updated."
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

  def change_users_group
    emails = []
    emails = params[:user_group_emails].split(",")
    emails = params[:user_group_emails].split(" ")
    group  = Group.find(params[:group_id])

    emails.each do |email|
      email = email.gsub(",", "")
      user  = User.find_by(email: email)

      if user.nil?
        new_user = User.invite!(email: email)
        flash[:alert] = "#{email} isnt a user. An invitation has been sent."
        group.users << new_user
      else
        group.users << user
      end

      redirect_back(fallback_location: root_path)
    end
  end

  def remove_user_from_group_path( options = {  })
    user  = User.find(params[:user_id])
    group = Group.find(params[:group_id])

    group.users.delete(user)
    redirect_to root_url
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