class PollOptionsController < ApplicationController

  before_action :set_poll_option

  def index
    @poll_options = PollOption.all
  end

  def show
  end

  def new
    @poll = Poll.find(params[:poll_id])
  end

  def create
    @poll_option.assign_attributes(poll_option_params)
    if @poll_option.save
      flash[:success] = "#{@poll_option.id}"
      redirect_to poll_option_path(@poll_option)
    else
      render "new"
    end
  end

  def edit
    @poll = Poll.find(@poll_option.poll_id)
  end

  def update
    if @poll_option.update(poll_option_params)
      flash[:success] = "You have updated the Poll Option!"
      redirect_to poll_option_path(@poll_option)
    else
      alert[:danger] = "Poll option unable to update."
    end
  end

  def destroy
    @poll_option.destroy
    flash[:success] = "Poll Option removed"
    redirect_to root_url
  end

  private

  def set_poll_option
    @poll_option = params[:id].present? ? PollOption.find(params[:id]) : PollOption.new
  end

  def poll_option_params
    params.require(:poll_option).permit(
      :description,
      :poll_id,
      :title,
      :user_id
    )
  end
end
