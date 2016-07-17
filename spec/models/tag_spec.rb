require 'rails_helper'

RSpec.describe Tag, type: :model do

  it { should have_and_belong_to_many(:videos) }

  it "has a valid factory" do
    expect(FactoryGirl.create(:tag)).to be_valid
  end

  it "is invalid without a firstname" do
    expect(FactoryGirl.build(:tag, title: nil)).not_to be_valid
  end

  it "is invalid with not uniq title" do
    FactoryGirl.create(:tag)
    expect(FactoryGirl.build(:tag)).not_to be_valid
  end

end
