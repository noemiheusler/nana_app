class Conversation < ActiveRecord::Base
    belongs_to :user1, :foreign_key => :user1_id, class_name: 'User'
    belongs_to :user2, :foreign_key => :user2_id, class_name: 'User'
    has_many :messages, dependent: :destroy
    validates_uniqueness_of :user1_id, :scope => :user2_id
    scope :with_messages, -> { joins(:messages).distinct }

    scope :between, -> (user1_id,user2_id) do
        where("(conversations.user1_id = ? AND conversations.user2_id =?) OR (conversations.user1_id = ? AND conversations.user2_id =?)", user1_id,user2_id, user2_id, user1_id)
    end
end
