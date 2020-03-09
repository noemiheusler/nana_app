class Event < ApplicationRecord
  belongs_to :user
  has_many :participations

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :title, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 200 }
  validates :max_participants, presence: true, numericality: { only_integer: true }
  validate :date_validation

  private

  def date_validation
    errors.add(:start_date, "Start date should smaller than end date!") if start_date > end_date
    errors.add(:end_date, "End date should bigger than start date!") if start_date > end_date
  end
end
