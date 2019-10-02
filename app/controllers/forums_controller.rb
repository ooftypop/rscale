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
    redirect_to current_user || root_url
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
