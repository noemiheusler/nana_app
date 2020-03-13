class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
# include PgSearch::Model
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  has_friendship

  has_many :kids
  has_many :events
  has_many :participations
  has_many :invitations
  has_many :answers
  has_many :favorites
  has_one_attached :photo

  validates  :firstname, presence: true, length: { maximum: 25 }
  validates  :lastname, presence: true, length: { maximum: 25 }
  validates  :address, length: { maximum: 200 }
  # validates  :motto, presence: true, length: { maximum: 200 }
  # validates  :description, presence: true, length: {maximum: 200}

#  pg_search_scope :search_by_brand_and_model_and_location,
#    against: [ :brand, :model, :location ],
#    ignoring: :accents,
#    using: {
#      tsearch: { prefix: true }
#    }
# end

  def calculate_match(user)
    score = 0
    user_a_answers = self.answers.pluck(:answer)
    user_b_answers = user.answers.pluck(:answer)
    user_a_answers.each_with_index do |answer, index|
      if answer == user_b_answers[index]
        score += 1
      end
    end
    (score / Question.all.size.to_f).round(2) * 100
  end

  def is_favorited?(current_user)
     if Favorite.where(user: current_user, nana: self).first
      true
    else
      false
    end
  end
end
