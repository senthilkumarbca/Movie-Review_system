class Movie < ApplicationRecord

  # ******************** Associations ********************
  has_many :ratings, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_one_attached :image

  # ******************** Validations ********************
  validates_presence_of :name, :release_date

  # ******************** Scope ********************
  # scope :search, -> (search_name) { where(name: search_name) }

  def self.search(search_name)
    if search_name.length > 0
      self.where("lower(name) LIKE ?", "%#{search_name.downcase}%")
    else
      Movie.all.order(average_rating: :desc)
    end
  end
  # ******************** Callbacks ********************
  def update_average_rating
    total_ratings = 0
    self.ratings.each { |r| total_ratings += r.star }
    ratings_count = self.ratings.size
    average_rating = (total_ratings.to_f / ratings_count.to_f).round(1)
    self.update_attribute(:average_rating, average_rating)
  end
end
