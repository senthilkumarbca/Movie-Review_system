class Movie < ApplicationRecord

  # ******************** Associations ********************
  has_many :ratings, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_one_attached :image

  # ******************** Validations ********************
  validates_presence_of :name, :release_date

  # ******************** Filters ********************
  scope :filter_by_date, -> (from_date, to_date) { where(release_date: from_date..to_date) }
  scope :search, -> (search_name) { where("lower(name) LIKE ?", "%#{search_name.downcase}%") }

  # ******************** Callbacks ********************
  def update_average_rating
    total_ratings = 0
    self.ratings.each { |r| total_ratings += r.star }
    ratings_count = self.ratings.size
    average_rating = (total_ratings.to_f / ratings_count.to_f).round(1)
    self.update_attribute(:average_rating, average_rating)
  end
end
