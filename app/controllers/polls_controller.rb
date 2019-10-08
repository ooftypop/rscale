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
      flash[:success] = "#{@poll.id}"
      redirect_to poll_path(@poll)
    else
      render "new"
    end
  end

  def edit
  end

  def update
    if @poll.update(poll_params)
      flash[:success] = "You have updated the Poll!"
      redirect_to poll_path(@poll)
    else
      alert[:danger] = "Poll unable to update."
    end
  end

  def destroy
    @poll.destroy
    flash[:success] = "Poll removed"
    redirect_to root_url
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
          flash[:danger] = "#{email} isnt a user. An invitation has been sent."
        end

        redirect_to root_path
      end
    end
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
