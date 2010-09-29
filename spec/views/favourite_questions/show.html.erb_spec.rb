require 'spec_helper'

describe "favourite_questions/show.html.erb" do
  before(:each) do
    @favourite_question = assign(:favourite_question, stub_model(FavouriteQuestion))
  end

  it "renders attributes in <p>" do
    render
  end
end
