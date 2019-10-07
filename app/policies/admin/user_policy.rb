class Admin::UserPolicy < AdminPolicy
  attr_reader :user, :user

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
