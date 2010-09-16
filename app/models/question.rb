class Question < Post

  include Sluggable

  use_as_slug :title

  has_many :answers
  has_and_belongs_to_many :tags

  validates :title, :presence => true, :length => { :maximum => 200 }
  validates :text, :presence => true
  validates :slug, :presence => true, :uniqueness => true

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