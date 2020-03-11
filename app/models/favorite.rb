class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :nana, :foreign_key => :nana_id, class_name: 'User'
  validates :nana_id, uniqueness: { scope: :user_id}
end
