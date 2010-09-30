class FavouriteQuestion < ActiveRecord::Base

  belongs_to :user
  belongs_to :question

end

# == Schema Info
#
# Table name: favourite_questions
#
#  id          :integer         not null, primary key
#  user_id     :integer
#  question_id :integer
#  created_at  :datetime
#  updated_at  :datetime