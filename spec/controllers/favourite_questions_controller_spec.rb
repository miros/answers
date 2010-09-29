require 'spec_helper'

describe FavouriteQuestionsController do

  def mock_favourite_question(stubs={})
    @mock_favourite_question ||= mock_model(FavouriteQuestion, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all favourite_questions as @favourite_questions" do
      FavouriteQuestion.stub(:all) { [mock_favourite_question] }
      get :index
      assigns(:favourite_questions).should eq([mock_favourite_question])
    end
  end

  describe "GET show" do
    it "assigns the requested favourite_question as @favourite_question" do
      FavouriteQuestion.stub(:find).with("37") { mock_favourite_question }
      get :show, :id => "37"
      assigns(:favourite_question).should be(mock_favourite_question)
    end
  end

  describe "GET new" do
    it "assigns a new favourite_question as @favourite_question" do
      FavouriteQuestion.stub(:new) { mock_favourite_question }
      get :new
      assigns(:favourite_question).should be(mock_favourite_question)
    end
  end

  describe "GET edit" do
    it "assigns the requested favourite_question as @favourite_question" do
      FavouriteQuestion.stub(:find).with("37") { mock_favourite_question }
      get :edit, :id => "37"
      assigns(:favourite_question).should be(mock_favourite_question)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created favourite_question as @favourite_question" do
        FavouriteQuestion.stub(:new).with({'these' => 'params'}) { mock_favourite_question(:save => true) }
        post :create, :favourite_question => {'these' => 'params'}
        assigns(:favourite_question).should be(mock_favourite_question)
      end

      it "redirects to the created favourite_question" do
        FavouriteQuestion.stub(:new) { mock_favourite_question(:save => true) }
        post :create, :favourite_question => {}
        response.should redirect_to(favourite_question_url(mock_favourite_question))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved favourite_question as @favourite_question" do
        FavouriteQuestion.stub(:new).with({'these' => 'params'}) { mock_favourite_question(:save => false) }
        post :create, :favourite_question => {'these' => 'params'}
        assigns(:favourite_question).should be(mock_favourite_question)
      end

      it "re-renders the 'new' template" do
        FavouriteQuestion.stub(:new) { mock_favourite_question(:save => false) }
        post :create, :favourite_question => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested favourite_question" do
        FavouriteQuestion.should_receive(:find).with("37") { mock_favourite_question }
        mock_favourite_question.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :favourite_question => {'these' => 'params'}
      end

      it "assigns the requested favourite_question as @favourite_question" do
        FavouriteQuestion.stub(:find) { mock_favourite_question(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:favourite_question).should be(mock_favourite_question)
      end

      it "redirects to the favourite_question" do
        FavouriteQuestion.stub(:find) { mock_favourite_question(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(favourite_question_url(mock_favourite_question))
      end
    end

    describe "with invalid params" do
      it "assigns the favourite_question as @favourite_question" do
        FavouriteQuestion.stub(:find) { mock_favourite_question(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:favourite_question).should be(mock_favourite_question)
      end

      it "re-renders the 'edit' template" do
        FavouriteQuestion.stub(:find) { mock_favourite_question(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested favourite_question" do
      FavouriteQuestion.should_receive(:find).with("37") { mock_favourite_question }
      mock_favourite_question.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the favourite_questions list" do
      FavouriteQuestion.stub(:find) { mock_favourite_question }
      delete :destroy, :id => "1"
      response.should redirect_to(favourite_questions_url)
    end
  end

end
