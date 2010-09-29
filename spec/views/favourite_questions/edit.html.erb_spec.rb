require 'spec_helper'

describe "favourite_questions/edit.html.erb" do
  before(:each) do
    @favourite_question = assign(:favourite_question, stub_model(FavouriteQuestion,
      :new_record? => false
    ))
  end

  it "renders the edit favourite_question form" do
    render

    rendered.should have_selector("form", :action => favourite_question_path(@favourite_question), :method => "post") do |form|
    end
  end
end
