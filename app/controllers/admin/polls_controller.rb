class Admin::PollsController < Admin::AdminController

  def index
    @polls = Poll.all
  end

  def show
    @poll = Poll.find_by(id: params[:id])
  end

  private

end
