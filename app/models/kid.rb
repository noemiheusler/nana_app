class Kid < ApplicationRecord
  belongs_to :user

  validates :birthday, presence: true
  validate :future_event

  private

  def future_event
    errors.add(:birthday, "Date should be in the past!") if birthday > Time.now
  end

end
