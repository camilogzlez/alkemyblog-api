class PostPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all.order(creation_date: :desc)
    end
  end 

  def show?
    true
  end

  def update?
    record.user == user
  end

  def create?
    !user.nil?
  end

  def destroy?
    update?
  end

end 