require 'spec_helper'

describe "answers/show.html.erb" do
  before(:each) do
    @answer = assign(:answer, stub_model(Answer))
  end

  it "renders attributes in <p>" do
    render
  end
end
