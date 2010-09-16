require 'spec_helper'

describe "questions/show.html.erb" do
  before(:each) do
    @question = assign(:question, stub_model(Question))
  end

  it "renders attributes in <p>" do
    render
  end
end
