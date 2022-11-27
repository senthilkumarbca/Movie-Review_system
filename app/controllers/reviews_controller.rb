class ReviewsController < ApplicationController
  before_action :set_movie
  before_action :set_review, only: %i[edit update destroy]

  def index
    @reviews = @movie.reviews
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id

    respond_to do |format|
      if @review.save
        format.html { redirect_to movie_reviews_path(@movie), notice: 'Review saved successfully.' }
      else
        format.html { redirect_to movie_reviews_path(@movie), notice: 'Review not saved.', status: :unprocessable_entity }
      end
    end
  end

  def edit

  end

  def update
    authorize! :update, @review
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to movie_reviews_path(@movie), notice: 'Review was successfully updated.' }
      else
        format.html { redirect_to :edit, notice: 'Review was successfully updated.', status: :unprocessable_entity }
      end
    end
  end

  def destroy
    authorize! :destroy, @review
    @review.destroy

    respond_to do |format|
      format.html { redirect_to movie_reviews_path(@movie), notice: 'Review was successfully destroyed.' }
    end
  end



  private
  def set_movie
    @movie = Movie.find(params[:movie_id])
  end

  def set_review
    @review = @movie.reviews.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:movie_id, :comment)
  end
end
