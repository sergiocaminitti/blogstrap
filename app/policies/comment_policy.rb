class CommentPolicy < ApplicationPolicy
  def create?
    user&.id
  end
  def destroy?
    user&.id == record.user_id
  end
end
