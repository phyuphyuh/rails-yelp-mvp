class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy
  validates :name, presence: true
  validates :address, presence: true
  validates :category, presence: true
  CATEGORY = ["chinese", "italian", "japanese", "french", "belgian"]
  validates :category, inclusion: { in: CATEGORY }

  def avg_rating
    return "No reviews" if reviews.empty?

    reviews.pluck(:rating).sum.fdiv(reviews.count).round(1)
  end
end
