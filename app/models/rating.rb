class Rating < ApplicationRecord
  after_create :update_movie_rating

  belongs_to :movie
  belongs_to :user

  def update_movie_rating
    movie.update_average_rating
  end
end
