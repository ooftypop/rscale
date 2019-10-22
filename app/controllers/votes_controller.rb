class VotesController < ApplicationController

  before_action :authenticate_user!

  before_action :set_vote, except: [:index, :show]

  def index
    @votes = Vote.all
  end

  def show
    @vote = Vote.find_by(user_id: current_user.id, poll_option_id: option_id)
  end

  def new
    @poll_option = PollOption.find(params[:poll_option_id])
  end

  def create
    @vote.assign_attributes(vote_params)
    if @vote.save
      flash[:notice] = "Your vote has been counted!"
    else
      flash[:alert] = "Vote not within range. Vote not counted."
    end
  end

  def destroy
    @vote.destroy
    flash[:notice] = "Vote removed"
    redirect_to root_url
  end

  private

  def set_vote
    @vote = params[:id].present? ? Vote.find(params[:id]) : Vote.new
  end

  def vote_params
    params.require(:vote).permit(
      :user_id,
      :rating,
      :poll_option_id
    )
  end
end
