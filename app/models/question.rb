class Question < ApplicationRecord
  has_many :onboarding_questions

  def self.total
    total ||= count
  end
end
