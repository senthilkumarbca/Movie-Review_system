require 'rails_helper'

RSpec.describe Rating, type: :model do
  context 'when creating a rating' do
    before(:each) do
      @movie = Movie.create!(name: "new movie", release_date: 'Thu, 29 Sep 2022')
      @user = User.create!(email: "user1@gmail.com", password: "123456")
    end
    let(:rating) { build :rating }

    it 'should have a star' do
      rating.movie = @movie
      rating.user = @user
      expect(rating).to be_valid

      rating.star = nil
      expect(rating).to_not be_valid
    end

    it 'should have a movie' do
      rating.movie = @movie
      rating.user = @user
      expect(rating).to be_valid

      rating.movie = nil
      expect(rating).to_not be_valid
    end

    it 'should have a user' do
      rating.movie = @movie
      rating.user = @user
      expect(rating).to be_valid

      rating.user = nil
      expect(rating).to_not be_valid
    end
  end
  
  context 'associations' do
    it 'should belongs to movie' do
      rating = Rating.reflect_on_association(:movie)
      expect(rating.macro).to eq(:belongs_to)
    end

    it 'should belongs to user' do
      rating = Rating.reflect_on_association(:user)
      expect(rating.macro).to eq(:belongs_to)

    end
  end
end
