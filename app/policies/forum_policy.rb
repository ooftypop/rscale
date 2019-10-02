class ForumPolicy < ApplicationPolicy
  attr_reader :user, :forum

  def edit?
    update?
  end

  def update?
    @user.has_role?(:founder, @record) || @user.has_role?(:moderator, @record)
  end

  def destroy?
    @user.has_role?(:founder)
  end
end
