class Comment < ActiveRecord::Base

  belongs_to :post

  validates :text, :presence => true
  validates :user_id, :presence => true
  validates :post_id, :presence => true

end

# == Schema Info
#
# Table name: comments
#
#  id         :integer         not null, primary key
#  post_id    :integer
#  user_id    :integer
#  text       :text
#  created_at :datetime
#  updated_at :datetime