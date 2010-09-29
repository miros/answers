require 'spec_helper'

describe "favourite_questions/index.html.erb" do
  before(:each) do
    assign(:favourite_questions, [
      stub_model(FavouriteQuestion),
      stub_model(FavouriteQuestion)
    ])
  end

  it "renders a list of favourite_questions" do
    render
  end
end
