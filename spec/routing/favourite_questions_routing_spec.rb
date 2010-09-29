require "spec_helper"

describe FavouriteQuestionsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/favourite_questions" }.should route_to(:controller => "favourite_questions", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/favourite_questions/new" }.should route_to(:controller => "favourite_questions", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/favourite_questions/1" }.should route_to(:controller => "favourite_questions", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/favourite_questions/1/edit" }.should route_to(:controller => "favourite_questions", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/favourite_questions" }.should route_to(:controller => "favourite_questions", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/favourite_questions/1" }.should route_to(:controller => "favourite_questions", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/favourite_questions/1" }.should route_to(:controller => "favourite_questions", :action => "destroy", :id => "1")
    end

  end
end
