class Movie < ApplicationRecord
  has_one_attached :image
  has_many :ratings

  def update_average_rating
    total_ratings = 0
    self.ratings.each { |r| total_ratings += r.star }
    ratings_count = self.ratings.size
    average_rating = (total_ratings.to_f / ratings_count.to_f).round(1)
    self.update_attribute(:average_rating, average_rating)
  end
end
