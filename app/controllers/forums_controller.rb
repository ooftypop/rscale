class ForumsController < ApplicationController

  before_action :set_forum, except: [:index]

  def index
    @forums = Forum.all
  end

  def show
  end

  def new
  end

  def create
    @forum.assign_attributes(forum_params)
    if @forum.save
      current_user.add_role :founder, @forum
      flash[:success] = "#{@forum.id}"
      redirect_to forum_path(@forum)
    else
      render "new"
    end
  end

  def edit
  end

  def update
    if @forum.update(forum_params)
      flash[:success] = "You have updated the forum!"
      redirect_to forum_path(@forum)
    else
      alert[:danger] = "Forum unable to update."
    end
  end

  def destroy
    @forum.destroy
    flash[:success] = "Forum closed"
    redirect_to root_url
  end

  def new_participants
    render 'form.js'
  end

  def create_participants

    Role.types.keys.each do |assign_role|
      roles = []
      role_symbol = (assign_role.to_s + "_emails").to_sym
      roles = params[role_symbol].split(",")
      roles = params[role_symbol].split(" ")
      roles.each do |email|
        email = email.gsub(",", "")
        user  = User.find_by(email: email)
        user.add_role(assign_role.to_sym, @forum) unless user.nil?
        if user.nil?
          flash[:danger] = "#{user} doesnt exist. Try inviting them?"
        end
        redirect_to root_path
      end
    end
  end

  private

  def set_forum
    @forum = params[:id].present? ? Forum.find(params[:id]) : Forum.new
  end

  def forum_params
    params.require(:forum).permit(
      :description,
      :title
    )
  end
end
