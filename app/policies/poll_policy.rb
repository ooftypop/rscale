class PollPolicy < ApplicationPolicy
  attr_reader :user, :poll

  def edit?
    update?
  end

  def update?
    @user.has_role?(:resource_admin, @record)
  end

  def destroy?
    @user.has_role?(:resource_admin, @record)
  end
end
