require 'spec_helper'

describe "questions/edit.html.erb" do
  before(:each) do
    @question = assign(:question, stub_model(Question,
      :new_record? => false
    ))
  end

  it "renders the edit question form" do
    render

    rendered.should have_selector("form", :action => question_path(@question), :method => "post") do |form|
    end
  end
end
