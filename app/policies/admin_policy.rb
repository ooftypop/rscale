class AdminPolicy < Struct.new(:user, :admin)
  def index?
    user.has_role? :admin
  end

  def edit?
    update?
  end

  def update?
    user.has_role? :admin
  end

  def show?
    user.has_role? :admin
  end
end
