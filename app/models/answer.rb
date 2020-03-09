class Answer < ApplicationRecord
  belongs_to :user
  has_many :onboarding_questions
end
