require 'rails_helper'

RSpec.describe Review, type: :model do
  context 'when creating a review' do
    before(:each) do
      @movie = Movie.create!(name: "new movie", release_date: 'Thu, 29 Sep 2022')
      @user = User.create!(email: "user1@gmail.com", password: "123456")
    end
    let(:review) { build :review }

    context "comments" do
      it 'should have a comment' do
        review.movie = @movie
        review.user = @user
        expect(review).to be_valid

        review.comment = nil
        expect(review).to_not be_valid
      end

      it 'should comment have minimum 10 characters' do
        review.movie = @movie
        review.user = @user
        review.comment = 'example'
        expect(review).to_not be_valid
        expect(review.comment.length).to_not be > 10
      end
    end

    it 'should have a movie' do
      review.movie = @movie
      review.user = @user
      expect(review).to be_valid

      review.movie = nil
      expect(review).to_not be_valid
    end

    it 'should have a user' do
      review.movie = @movie
      review.user = @user
      expect(review).to be_valid

      review.user = nil
      expect(review).to_not be_valid
    end
  end

  context 'associations' do
    it "should belongs to movie" do
      review = Review.reflect_on_association(:movie)
      expect(review.macro).to eq(:belongs_to)
    end

    it 'should belongs to user' do
      review = Review.reflect_on_association(:user)
      expect(review.macro).to eq(:belongs_to)
    end
  end
end
