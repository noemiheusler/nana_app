class Event < ApplicationRecord
  belongs_to :user
  has_many :participations, dependent: :destroy
  has_many :invitations, dependent: :destroy
  has_one_attached :photo

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :title, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 200 }
  validates :max_participants, presence: true, numericality: { only_integer: true }
  validates :location, presence: true, length: { maximum: 200 }
  # accept nested attributes
  validate :date_validation

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  private

  def date_validation
    errors.add(:start_date, "Start date should smaller than end date!") if start_date > end_date
    errors.add(:end_date, "End date should bigger than start date!") if start_date > end_date
  end
end
