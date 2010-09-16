require 'spec_helper'

describe "questions/index.html.erb" do
  before(:each) do
    assign(:questions, [
      stub_model(Question),
      stub_model(Question)
    ])
  end

  it "renders a list of questions" do
    render
  end
end
