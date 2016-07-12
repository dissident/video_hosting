require 'rails_helper'

RSpec.describe "images/show", type: :view do
  before(:each) do
    @image = assign(:image, Image.create!(
      :title => "Title",
      :user => nil,
      :file => "File"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(//)
    expect(rendered).to match(/File/)
  end
end
