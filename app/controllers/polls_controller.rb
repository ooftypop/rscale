class PollsController < ApplicationController

  before_action :set_poll, except: [:index]

  def index
    @polls = Poll.all
  end

  def show
  end

  def new
    @forum = Forum.find(params[:forum_id])
  end

  def create
    @poll.assign_attributes(poll_params)
    if @poll.save
      flash[:success] = "#{@poll.id}"
      redirect_to poll_path(@poll)
    else
      render "new"
    end
  end

  def edit
    @forum = Forum.find(@poll.forum_id)
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

  private

  def set_poll
    @poll = params[:id].present? ? Poll.find(params[:id]) : Poll.new
  end

  def poll_params
    params.require(:poll).permit(
      :description,
      :forum_id,
      :title
    )
  end
end
