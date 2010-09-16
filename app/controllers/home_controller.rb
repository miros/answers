class HomeController < ApplicationController

  def index

    @questions = Question.limit(20)

  end

end
