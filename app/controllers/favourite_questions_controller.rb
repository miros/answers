class FavouriteQuestionsController < ApplicationController

  before_filter :authenticate_user!

  def index
    @favourite_questions = current_user.favourite_questions.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @favourite_questions }
    end
  end

  def show
    @favourite_question = current_user.favourite_questions.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @favourite_question }
    end
  end

  # POST /favourite_questions
  # POST /favourite_questions.xml
  def create

    @question = Question.find(params[:question_id])

    @favourite_question = current_user.favourite_questions.find_or_initialize_by_question_id(:question_id => @question.id)

    if @favourite_question.new_record?
      @favourite_question.save!
    else
      @favourite_question.destroy
    end

    respond_to do |format|
      format.html { redirect_to(@question, :notice => 'Favourite question was successfully toggled.') }
      format.js
    end
  end

  # DELETE /favourite_questions/1
  # DELETE /favourite_questions/1.xml
  def destroy
    @favourite_question = current_user.favourite_questions.find(params[:id])
    @favourite_question.destroy

    respond_to do |format|
      format.html { redirect_to(favourite_questions_url) }
      format.xml  { head :ok }
    end
  end
end
