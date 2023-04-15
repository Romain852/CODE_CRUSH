class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      else
        scope.where(id: user.id)
      end
    end
  end

  def index?
    user.admin?
  end

  def show?
    user.admin? || record == user
  end

  def edit?
    user.admin? || record == user
  end

  def update?
    user.admin? || record == user
  end

  def destroy?
    user.admin? || record == user
  end

  def new?
    user.admin?
  end

  def create?
    user.admin?
  end

  def manage?
    user.admin?
  end

  def manage_users?
    user.admin?
  end

  def manage_courses?
    user.admin?
  end

  def manage_enrolments?
    user.admin?
  end

  def manage_reviews?
    user.admin?
  end

  def manage_categories?
    user.admin?
  end
end
