class Review < ApplicationRecord
  # ******************** Validations ********************
  validates_presence_of :comment, :movie_id, :user_id
  validates_length_of :comment, minimum: 10

  # ******************** Associations ********************
  belongs_to :movie, counter_cache: true
  belongs_to :user



end
