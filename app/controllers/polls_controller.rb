class PollsController < ApplicationController

  before_action :set_poll, except: [:index]

  def index
    @polls = Poll.all
  end

  def show
  end

  def new
  end

  def create
    @poll.assign_attributes(poll_params)
    if @poll.save
      current_user.add_role :resource_admin, @poll
      flash[:notice] = "Poll has been created!"
      redirect_to poll_path(@poll)
    else
      flash[:alert] = "Poll not created"
      render "new"
    end
  end

  def edit
  end

  def update
    if @poll.update(poll_params)
      flash[:notice] = "You have updated the Poll!"
      redirect_to poll_path(@poll)
    else
      flash[:alert] = "Poll unable to update."
    end
  end

  def destroy
    @poll.destroy
    flash[:notice] = "Poll removed"
    redirect_to root_url
  end

  def add_groups
    @group_options = current_user.email_groups.map { |group| [group.title, group.id]}
    render 'add_groups_form.js'
  end

  def create_poll_groups
    groups      = []
    users       = []
    user_groups = params[:user_groups]
    poll        = Poll.find(params[:poll_id].to_i)

    user_groups.each do |group_id|
      group = Group.find(group_id)
      group.users.each do |user|
        users = users.push(user)
      end
    end

    users.each do |user|
      user.add_role(:user, poll)
    end

    redirect_to poll_path(poll)
  end

  def new_participants
    render 'form.js'
  end

  def create_participants
    Role.types.keys.each do |assign_role|
      roles       = []
      role_symbol = (assign_role.to_s + "_emails").to_sym
      roles       = params[role_symbol].split(",")
      roles       = params[role_symbol].split(" ")

      roles.each do |email|
        email = email.gsub(",", "")
        user  = User.find_by(email: email)

        user.add_role(assign_role.to_sym, Poll.find_by(id: params[:poll_id].to_i)) unless user.nil?

        if user.nil?
          new_user = User.invite!(email: email)
          new_user.add_role(assign_role.to_sym, Poll.find_by(id: params[:poll_id].to_i))
          flash[:alert] = "#{email} isnt a user. An invitation has been sent."
        end

        redirect_to root_path
      end
    end
  end

  def remove_user_from_poll( options = {  })
    user = User.find(params[:user_id])
    poll = Poll.find(params[:resource_id])
    name = params[:name].to_sym
    user.remove_role(name, poll)
    redirect_to poll_path(poll)
  end

  private

  def set_poll
    @poll = params[:id].present? ? Poll.find(params[:id]) : Poll.new
  end

  def poll_params
    params.require(:poll).permit(
      :description,
      :title
    )
  end
end
