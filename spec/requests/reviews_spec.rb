require 'rails_helper'

RSpec.describe "Reviews", type: :request do
  before(:each) do
    @user = User.create!(email: "user1@gmail.com", password: "123456")
    @user.confirm
    sign_in(@user)
    @movie = Movie.create!(name: "new movie", release_date: 'Thu, 29 Sep 2022', average_rating: '0')
  end
  let(:valid_attributes) do{
    'comment' => "example review comment",
    'user_id' => @user.id,
    'movie_id' => @movie.id
  }
  end

  let(:invalid_attributes) do{
    'comment' => "example",
    'user_id' => @user.id,
    'movie_id' => @movie.id
  }
  end
  describe "GET /reviews" do
    it "renders a successful response" do
      Review.create!(valid_attributes)
      get movie_reviews_path(@movie)
      expect(response).to be_successful
      expect(response).to render_template(:index)
      expect(response.status).to be(200)
    end
  end

  describe "GET /edit" do
    it 'renders a successful response' do
      review = Review.create!(valid_attributes)
      get edit_movie_review_path(@movie, review)
      expect(response).to be_successful
      expect(response.status).to be(200)
    end
  end

  describe "POST /create" do
    it 'creates a new review' do
      expect {
        post movie_reviews_path(@movie), params: {review: valid_attributes}
      }.to change(Review, :count).by(1)
      expect(response).to redirect_to(movie_reviews_path(@movie))
      expect(response.status).to be(302)
    end
  end

  describe "PATCH /update" do
    context "with valid parameteers" do
      let(:new_attributes) do{
        'comment' => "updated review comment",
        'user_id' => @user.id,
        'movie_id' => @movie.id
      }
      end

      it 'updates the requested review' do
        review = Review.create!(valid_attributes)
        patch movie_review_path(@movie,review), params: {review: new_attributes}
        review.reload
        expect(response).to redirect_to(movie_reviews_path(@movie))
        expect(response.status).to be(302)
      end
    end
    context "with invalid parameters" do
      it 'render successful response' do
        review = Review.create!(valid_attributes)
        patch movie_review_path(@movie, review), params: {review: invalid_attributes}
        expect(response).to render_template(:edit)
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /destroy" do
    it 'destroys the requested review' do
      review = Review.create!(valid_attributes)
      expect{
        delete movie_review_path(@movie, review)
      }.to change(Review, :count).by(-1)
      expect(response.status).to be(302)
      expect(response).to redirect_to(movie_reviews_path(@movie))
    end
  end
end
