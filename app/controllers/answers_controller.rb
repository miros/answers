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

  # POST /accept
  def accept
    @answer = Answer.find(params[:id])

    unless @answer.user == current_user
      render :status => :unauthorized
      return
    end

    @answer.accepted = true

    respond_to do |format|
      unless @answer.save
         msg = "You already marked one of answers as accepted"
         format.html { redirect_to @answer.question, :notice => msg }
         format.js { render :text => "alert('#{msg}')" }
      else
        format.html { redirect_to @answer.question, :notice => 'Answer marked as accepted' }
        format.js
      end
    end

  end


end
