class VotesController < ApplicationController

  before_action :set_vote, except: [:index]

  def index
    @votes = Vote.all
  end

  def show
  end

  def new
    @poll_option = PollOption.find(params[:poll_option_id])
  end

  def create
    @vote.assign_attributes(vote_params)
    if @vote.save
      flash[:notice] = "Your vote has been counted!"
      redirect_to poll_option_path(id: @vote.poll_option_id)
    else
      flash[:alert] = "Vote not counted."
      render "new"
    end
  end

  def edit
    @poll_option = PollOption.find(@vote.poll_option_id)
  end

  def update
    if @vote.update(vote_params)
      flash[:notice] = "You have updated your vote!"
      redirect_to vote_path(@vote)
    else
      flash[:alert] = "Vote not counted."
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
