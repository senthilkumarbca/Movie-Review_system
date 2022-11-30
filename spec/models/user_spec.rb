require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build :user }
  let(:user1) { build :user, email: nil }
  let(:user2) { build :user, password: nil }
  let(:user3) { build :user, password: '12345' }

  context "when creating user" do

    it 'should have a email' do
      expect(user).to be_valid
      expect(user1).to_not be_valid
    end

    it "should have a password" do
      expect(user).to be_valid
      expect(user2).to_not be_valid
    end
    it 'should password has minimum six characters' do
      expect(user3).to_not be_valid
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
