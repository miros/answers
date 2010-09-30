module ApplicationHelper

  def star_text
    (current_user && current_user.question_favourite?(@question)) ? '!*!' : '*'
  end

end
