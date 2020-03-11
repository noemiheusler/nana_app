class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :nana, :foreign_key => :nana_id, class_name: 'User'
end
