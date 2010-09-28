class Post < ActiveRecord::Base

  belongs_to :question
  belongs_to :user
  has_many :comments
  has_many :post_votes

  validates :text, :presence => true
  validates :user_id, :presence => true


  def update_rating
    rating = self.post_votes.inject(0) {|rating, vote| rating + vote.rating}
    self.update_attribute(:rating, rating)
  end

end


# == Schema Info
#
# Table name: posts
#
#  id            :integer         not null, primary key
#  type          :string(255)
#  user_id       :integer         not null
#  rating        :integer         not null, default(0)
#  title         :string(255)     not null
#  slug          :string(255)
#  text          :text            not null
#  views_count   :integer
#  created_at    :datetime
#  updated_at    :datetime
#  answers_count :integer         not null, default(0)
#  question_id   :integer         not null, default(0)