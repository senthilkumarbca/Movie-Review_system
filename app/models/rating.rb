class Rating < ApplicationRecord
  after_create :update_movie_rating

  # ******************** Associations ********************
  belongs_to :movie
  belongs_to :user

  # ******************** Validations ********************
  validates_presence_of :star, :user_id, :movie_id
  validates_uniqueness_of :movie_id, scope: :user_id

  # ******************** Callbacks ********************
  def update_movie_rating
    movie.update_average_rating
  end
end
