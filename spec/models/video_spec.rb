require 'rails_helper'

RSpec.describe Video, type: :model do

  it { should have_and_belong_to_many(:tags) }
  it { should belong_to(:user) }

  it "has a valid factory" do
    expect(FactoryGirl.create(:video)).to be_valid
  end

  it "is invalid without a file" do
    expect(FactoryGirl.build(:video, file: nil)).not_to be_valid
  end

  it "have title eq name of file, when title is nil on create" do
    video = FactoryGirl.create(:video, title: nil)
    expect(video).to be_valid
    expect(video.title).to eq("bird.avi")
  end

end
