require 'spec_helper'

describe "answers/edit.html.erb" do
  before(:each) do
    @answer = assign(:answer, stub_model(Answer,
      :new_record? => false
    ))
  end

  it "renders the edit answer form" do
    render

    rendered.should have_selector("form", :action => answer_path(@answer), :method => "post") do |form|
    end
  end
end
