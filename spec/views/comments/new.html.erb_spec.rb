require 'spec_helper'

describe "comments/new.html.erb" do
  before(:each) do
    assign(:comment, stub_model(Comment,
      :new_record? => true
    ))
  end

  it "renders new comment form" do
    render

    rendered.should have_selector("form", :action => comments_path, :method => "post") do |form|
    end
  end
end
