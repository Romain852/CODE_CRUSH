class EnrolmentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      # if user.admin?
      scope.all
      # else
      # scope.joins(:enrolment).where("enrolment.user_id = ?", user.id)
      # scope.joins(:course).where("courses.user_id = ?", user.id)
      # end
    end
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    true
  end

  def update?
    true
  end

  def destroy?
    true
  end

  def edit?
    update?
  end

  def new?
    create?
  end

end
