class Admin::PollPolicy < Admin::AdminPolicy
  attr_reader :user, :poll

  def index?
    @user.has_role?(:admin)
  end

  def edit?
    update?
  end

  def update?
    @user.has_role?(:admin)
  end
end
