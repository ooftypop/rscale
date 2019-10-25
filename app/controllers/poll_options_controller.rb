class PollOptionsController < ApplicationController

  before_action :authenticate_user!

  before_action :set_poll_option, except: [:index, :show]

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
      flash[:notice] = "Poll option has been created!"
      redirect_to poll_path(@poll_option.poll_id)
    else
      flash[:alert] = "Poll option not created."
    end
  end

  def edit
  end

  def update
    if @poll_option.update(poll_option_params)
      flash[:notice] = "You have updated the Poll Option!"
      redirect_to poll_path(@poll_option.poll_id)
    else
      flash[:alert] = "Poll option unable to update."
    end
  end

  def destroy
    @poll = @poll_option.poll.id
    @poll_option.destroy
    flash[:notice] = "Poll Option removed"
    redirect_to poll_path(@poll)
  end

  private

  def set_poll_option
    @poll_option = params[:id].present? ? PollOption.find_by(id: params[:id].to_i) : PollOption.new
  end

  def poll_option_params
    params.require(:poll_option).permit(
      :description,
      :poll_id,
      :title,
      :user_id,
      :content
    )
  end
end
