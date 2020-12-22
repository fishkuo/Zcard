class BoardPolicy < ApplicationPolicy
  def hide?
    user && user.role == 'bm' && record.user == user
  end

  def lock?
    hide?
  end

  def open?
    hide?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
