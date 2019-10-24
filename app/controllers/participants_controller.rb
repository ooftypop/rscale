class ParticipantsController < ApplicationController

  before_action :set_poll, except: [:index, :remove_user_from_poll]

  def add_groups
    if current_user.email_groups.empty?
      @group_options = []
    else
      @group_options = current_user.email_groups.map { |group| [group.title, group.id]}
    end
    render 'add_groups_to_poll_form.js'
  end

  def add_poll_groups
    users         = []
    user_groups   = params[:user_groups]
    poll          = Poll.find(params[:poll_id].to_i)
    current_users = []

    user_groups.each do |group_id|
      group = Group.find(group_id)
      group.users.each do |user|
        users = users.push(user)
      end
    end

    users.each do |user|
      if user.has_role?(:moderator, poll) || user.has_role?(:user, poll)
        current_users = current_users.push(user.email)
        flash[:notice] = "#{current_users} are part of the poll already."
      else
        user.add_role(:user, poll)
        PollMailer.poll_invite_email(user, poll) #deliver_later(wait: 1.minutes.from_now)
      end
    end

    redirect_to poll_path(poll)
  end

  def new_poll_roles
    if current_user.email_groups.empty?
      @users = []
    else
      current_user.email_groups.each do |group|
        @users = group.users.map { |user| [user.email, user.email]}
      end
    end

    render 'add_users_to_poll_form.js'
  end

  def create_poll_roles
    Role.types.keys.each do |role|
      role_symbol   = (role.to_s + "_emails").to_sym
      email_array   = params[role_symbol].to_s.split(",")
      poll          = Poll.find_by(id: params[:poll_id].to_i)
      new_users     = []
      current_users = []

      email_array.each do |email|
        email = email.gsub(/[," ]/, '')
        email = email.gsub("[", "")
        email = email.gsub("]", "")

        user = User.find_by(email: email)

        if user.nil?
          new_user = User.invite!(email: email)
          new_users = new_users.push(email)

          new_user.add_role(role.to_sym, Poll.find_by(id: params[:poll_id].to_i))
          flash[:notice] = "#{new_users} isnt a user. An invitation has been sent."
        else
          if user.has_role?(:moderator, poll) || user.has_role?(:user, poll)
            current_users = current_users.push(user.email)
            flash[:notice] = "#{current_users} are part of the poll already."
          else
            user.add_role(role.to_sym, poll)
            PollMailer.poll_invite_email(user, poll) #.deliver_later(wait: 1.minutes.from_now)
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
