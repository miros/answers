require 'spec_helper'

describe "questions/new.html.erb" do
  before(:each) do
    assign(:question, stub_model(Question,
      :new_record? => true
    ))
  end

  it "renders new question form" do
    render

    rendered.should have_selector("form", :action => questions_path, :method => "post") do |form|
    end
  end
end
