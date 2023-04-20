class CoursePolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
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

  def enroll?
    user && !user.enrolled_in?(record)
  end
end
