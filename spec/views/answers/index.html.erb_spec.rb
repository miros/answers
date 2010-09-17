require 'spec_helper'

describe "answers/index.html.erb" do
  before(:each) do
    assign(:answers, [
      stub_model(Answer),
      stub_model(Answer)
    ])
  end

  it "renders a list of answers" do
    render
  end
end
