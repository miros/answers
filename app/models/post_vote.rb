class PostVote < ActiveRecord::Base

  belongs_to :post
  belongs_to :user

  validates :post_id, :presence => true
  validates :user_id, :presence => true

  after_save :update_post_rating

  private

    def update_post_rating
      self.post.update_rating()      
    end

end
