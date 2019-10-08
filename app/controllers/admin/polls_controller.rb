class Admin::PollsController < Admin::AdminController

  before_action :set_poll, except: [:index]

  def index
    @polls = Poll.all
    authorize :admin, :index?
  end

  def show
    # @poll = Poll.find_by(id: params[:id])
    authorize :admin, :show?
  end

  def edit
    # @poll = Poll.find_by(id: params[:id])
    authorize :admin, :edit?
  end

  def update
    authorize :admin, :edit?
  end

  # def destroy
  #   @poll = Poll.find_by(id: params[:id])
  #   authorize :admin, :destroy?
  # end

  private

  def set_poll
    @poll = Poll.find(params[:id])
  end

end
