class AnswersController < ApplicationController

  before_filter :authenticate_user!

  # POST /answers
  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new(params[:answer])
    @answer.user = current_user

      if @answer.save
        redirect_to(@question, :notice => 'Answer was successfully created.')
      else
        render :action => "new"
      end
  end



end
