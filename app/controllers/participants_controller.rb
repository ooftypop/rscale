class ParticipantsController < ApplicationController

  before_action :set_poll, except: [:index, :remove_user_from_poll]

  def add_groups
    @group_options = current_user.email_groups.map { |group| [group.title, group.id]}
    render 'add_groups_to_poll_form.js'
  end

  def add_poll_groups
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

  def new_poll_roles
    current_user.email_groups.each do |group|
      @users = group.users.map { |user| [user.email, user.email]}
    end

    render 'add_users_to_poll_form.js'
  end

  def create_poll_roles
    Role.types.keys.each do |assign_role|
      role_symbol   = (assign_role.to_s + "_emails").to_sym
      roles         = params[role_symbol].to_s.split(",")
      roles         = params[role_symbol].to_s.split(" ")
      poll          = Poll.find_by(id: params[:poll_id].to_i)

      all_new_users = []

      roles.each do |email|
        email = email.gsub(/[," ]/, '')
        email = email.gsub("[", "")
        email = email.gsub("]", "")
        user  = User.find_by(email: email)

        if user.nil?
          new_user = User.invite!(email: email)
          all_new_users = all_new_users.push(email)

          new_user.add_role(assign_role.to_sym, Poll.find_by(id: params[:poll_id].to_i))
          flash[:notice] = "#{all_new_users} isnt a user. An invitation has been sent."
        else
          if user.has_role?(:moderator, poll) || user.has_role?(:user, poll)
            flash[:notice] = "#{user.email} is already part of the poll."
          else
            user.add_role(assign_role.to_sym, poll)
          end
        end

      end
    end

    redirect_to poll_path(@poll)
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
    @poll = Poll.find(params[:poll_id])
  end

end
