require 'spec_helper'

describe "answers/new.html.erb" do
  before(:each) do
    assign(:answer, stub_model(Answer,
      :new_record? => true
    ))
  end

  it "renders new answer form" do
    render

    rendered.should have_selector("form", :action => answers_path, :method => "post") do |form|
    end
  end
end
