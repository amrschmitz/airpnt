class CaringPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def history?
    true
  end

  def new?
    true
  end

  def create?
    true
  end

  def decline?
    true
  end

  def accept?
    true
  end

end
