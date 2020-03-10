class MessagePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    record.conversation.user1_id == user.id || record.conversation.user2_id == user.id
  end

  def show?
    user
  end
end
