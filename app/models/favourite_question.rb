class FavouriteQuestion < ActiveRecord::Base

  belongs_to :user
  belongs_to :question

end
