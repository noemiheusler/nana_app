class ConversationPolicy < ApplicationPolicy
    class Scope < Scope
      def resolve
        scope.where(user1_id: user.id).or(scope.where(user2_id: user.id))
  
      end
    end
  
    def create?
      user
    end
  
    def show?
  
      record.user1_id == user.id || record.user2_id == user.id
    end
  end 