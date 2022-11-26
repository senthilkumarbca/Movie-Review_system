class Review < ApplicationRecord
  # ******************** Associations ********************
  belongs_to :movie, counter_cache: true
  belongs_to :user

  # ******************** Validations ********************
  validates_presence_of :comment, :movie_id, :user_id
  validates_length_of :comment, minimum: 10

end
