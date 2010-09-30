class PostVote < ActiveRecord::Base

  class AlreadyVotedError < Exception; end

  belongs_to :post
  belongs_to :user

  validates :post_id, :presence => true
  validates :user_id, :presence => true, :uniqueness => {:scope => [:post_id]}

  after_save :update_post_rating

  private

    def update_post_rating
      self.post.update_rating()      
    end

end

# == Schema Info
#
# Table name: post_votes
#
#  id         :integer         not null, primary key
#  post_id    :integer
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#  rating     :integer