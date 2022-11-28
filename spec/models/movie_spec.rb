require 'rails_helper'

RSpec.describe Movie, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  context 'when creating a movie' do
    let(:movie) { build :movie }

    it 'should be valid movie' do
      expect(movie.valid?).to eq(true)
    end
  end
end
