require 'spec_helper'

describe "favourite_questions/new.html.erb" do
  before(:each) do
    assign(:favourite_question, stub_model(FavouriteQuestion,
      :new_record? => true
    ))
  end

  it "renders new favourite_question form" do
    render

    rendered.should have_selector("form", :action => favourite_questions_path, :method => "post") do |form|
    end
  end
end
