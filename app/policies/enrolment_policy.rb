class EnrolmentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      else
        scope.joins(:course).where("courses.user_id = ?", user.id)
      end
    end
  end

  def index?
    user.admin? || user.enrolled_in?(record.course)
  end

  def show?
    user.admin? || user.enrolled_in?(record.course)
  end

  def create?
    user.enrolled_in?(record.course)
  end

  def update?
    user.admin? || user.enrolled_in?(record.course)
  end

  def destroy?
    user.admin? || user.enrolled_in?(record.course)
  end
end
