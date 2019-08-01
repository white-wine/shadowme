class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def show?
    user.student? || user.professional?
  end

  def confirm?
    user.professional?
  end

  def decline?
    user.professional?
  end
end
