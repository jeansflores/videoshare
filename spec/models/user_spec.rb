require 'rails_helper'

RSpec.describe User, :type => :model do
  describe "Associations" do
    it { should have_many(:videos) }
  end

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(build(:user)).to be_valid
    end

    it "is not valid without a email" do
      expect(build(:user, email: nil)).to_not be_valid
    end

    it "is not valid without a password" do
      expect(build(:user, password: nil)).to_not be_valid
    end
  end
end
