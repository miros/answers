require 'spec_helper'

describe "posts/show.html.erb" do
  before(:each) do
    @post = assign(:post, stub_model(Post))
  end

  it "renders attributes in <p>" do
    render
  end
end
