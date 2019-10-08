class Admin::PollsController < Admin::AdminController

  before_action :set_poll, except: [:index]

  def index
    @polls = Poll.all
    authorize :admin, :index?
  end

  def show
    authorize :admin, :show?
  end

  def edit
    authorize :admin, :edit?
  end

  def update
    authorize :admin, :edit?
  end

  private

  def set_poll
    @poll = Poll.find(params[:id])
  end

end
