require 'rails_helper'

RSpec.describe Video, :type => :model do
  describe "Associations" do
    it { should belong_to(:user) }
  end

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(build(:video)).to be_valid
    end

    it "is not valid without a name" do
      expect(build(:video, name: nil)).to_not be_valid
    end

    it "is not valid without a url" do
      expect(build(:video, url: nil)).to_not be_valid
    end

    it "is not valid without a user_id" do
      expect(build(:video, user_id: nil)).to_not be_valid
    end
  end

  describe "Methods" do
    context "#add_view" do
      it "should increment the views account" do
        video = create(:video)
        expect(video.add_view).to equal(true)
        expect(video.views).to equal(1)
      end
    end
  end
end
