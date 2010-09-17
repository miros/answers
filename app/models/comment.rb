class Comment < ActiveRecord::Base

  belongs_to :post

  validates :text, :presence => true
  validates :user_id, :presence => true
  validates :post_id, :presence => true

end
