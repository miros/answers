require 'spec_helper'

describe "posts/index.html.erb" do
  before(:each) do
    assign(:posts, [
      stub_model(Post),
      stub_model(Post)
    ])
  end

  it "renders a list of posts" do
    render
  end
end
