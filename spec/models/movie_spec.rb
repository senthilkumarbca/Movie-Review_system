require 'rails_helper'

RSpec.describe Movie, type: :model do
  context 'when creating a movie' do
    let(:movie) { build :movie }

    it 'should be valid movie' do
      expect(movie.valid?).to eq(true)
    end

    it "should have a name" do
      movie.name = nil
      expect(movie).to_not be_valid
    end

    it 'should have a release date' do
      movie.release_date = nil
      expect(movie).to_not be_valid
    end
  end

  context 'associations' do
    it "should has many review" do
      should respond_to(:reviews)
    end

    it 'should has many ratings' do
      should respond_to(:ratings)
    end
  end
end
