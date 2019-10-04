class PollsController < ApplicationController

  before_action :set_poll, except: [:index]
  before_action :set_forum,  only: [:index, :new, :edit]

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
      flash[:success] = "#{@poll.id}"
      redirect_to root_path
      # redirect_to poll_path(@poll)
    else
      render "new"
    end
  end

  def edit
  end

  def update
    if @poll.update(forum_params)
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

  def set_forum
    @forum = Forum.find(params[:forum_id])
  end

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
