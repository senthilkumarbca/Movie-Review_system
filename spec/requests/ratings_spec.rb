require 'rails_helper'

RSpec.describe "movies/ratings", type: :request do
  before(:each) do
    @user = User.create!(email: "user1@gmail.com", password: "123456")
    @user.confirm
    sign_in(@user)
    @movie = Movie.create!(name: "new movie", release_date: 'Thu, 29 Sep 2022', average_rating: '0')
  end

  let(:valid_attributes) do{
    'star' => 3,
    'user_id' => @user.id,
    'movie_id' => @movie.id
  }
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_movie_rating_path(@movie)
      expect(response).to be_successful
      expect(response.status).to be(200)
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new rating ' do
        expect {
          post movie_ratings_path(@movie), params: { rating: valid_attributes }
        }.to change(Rating, :count).by(1)
        expect(response.status).to be(302)
        expect(response).to redirect_to(movies_path)
      end
    end
  end
end
