class ReviewsController < ApplicationController
  before_action :set_movie

  def index
    @reviews = Review.all
  end

  def create
    @review = Review.new(ratings_params)
    @review.user_id = current_user.id

    respond_to do |format|
      if @review.save
        format.html { redirect_to movie_reviews_path(@movie), notice: 'Review saved successfully.' }
      else
        format.html { redirect_to movie_reviews_path(@movie), notice: 'Review not saved.', status: :unprocessable_entity }
      end
    end
  end

  private
  def set_movie
    @movie = Movie.find(params[:movie_id])
  end

  def ratings_params
    params.require(:review).permit(:movie_id, :comment)
  end
end
