class RatingsController < ApplicationController
  before_action :set_movie

  def new

  end
  def create
    @rating = Rating.new(ratings_params)
    @rating.user_id = current_user.id

    respond_to do |format|
      format.html {
        redirect_to movies_path, notice: @rating.save ? 'Rating saved successfully.' : 'Rating not saved.'
      }
    end
  end

  private
  def set_movie
    @movie = Movie.find(params[:movie_id])
  end

  def ratings_params
    params.require(:rating).permit(:movie_id, :star, :user_id)
  end
end
