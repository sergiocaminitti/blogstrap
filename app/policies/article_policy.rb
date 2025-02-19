class ArticlePolicy < ApplicationPolicy
  class Scope < ApplicationPolicy::Scope
    def resolve
      scope.all
    end
  end
  def show?
    true
  end
  def create?
    user&.id
  end
  def update?
    # só o usuário que criou o artigo pode editá-lo
    user&.id == record.user.id
  end

  def destroy?
    # só o usuário que criou o artigo pode destruílo
    user&.id == record.user.id
  end
end
