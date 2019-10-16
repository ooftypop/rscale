class PollsController < ApplicationController

  before_action :set_poll, except: [:index]

  def index
    @polls = Poll.all
  end

  def show
  end

  def new
    @poll.poll_options.build
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
    @poll.poll_options.build
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

  private

  def set_poll
    @poll = params[:id].present? ? Poll.find(params[:id]) : Poll.new
  end

  def poll_params
    params.require(:poll).permit(
      :description,
      :title,
      poll_options_attributes: [:id,
                                :title,
                                :description,
                                :poll_id,
                                :user_id,
                                :_destroy]
    )
  end
end
