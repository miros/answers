class HomeController < ApplicationController

  def index

    @questions = Question.paginate :page => params[:page]

  end

end
