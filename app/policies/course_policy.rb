class CoursePolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      user.admin? ? scope.all : scope.where(user: user)
    end
  end

  def show?
    true
  end

  def create?
    user.role == 1 || user.admin?
  end

  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end

  def edit?
    update?
  end

  def new?
    create?
  end

  def data?
    true
  end

  def fullstack?
    true
  end

  def search?
    true
  end
end
