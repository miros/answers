class Question < Post

  cattr_reader :per_page
  @@per_page = 3

  default_scope order('created_at DESC')

  include Sluggable

  use_as_slug :title

  has_many :answers, :order => 'accepted DESC, rating DESC'
  has_and_belongs_to_many :tags
  has_many :views, :class_name => "QuestionView"
  has_many :favourite_questions
  has_one :accepted_answer, :class_name => "Answer", :conditions => "accepted = '1'" 

  validates :title, :presence => true, :length => { :maximum => 200 }
  validates :text, :presence => true
  validates :slug, :presence => true, :uniqueness => true

  attr_protected :tags

  attr_writer :tags_string

  def tags_string
    self.tags.map(&:name).join(', ')    
  end

  def mark_seen_by(user)
    self.views.find_or_create_by_user_id(user.id)
  end

  def favourites_count
    self.favourite_questions.count
  end

  before_save :set_tags

  private

    def set_tags
      return unless @tags_string 
      tags = @tags_string.split(',').map {|tag_name| tag_name.mb_chars.downcase.strip }.delete_if(&:empty?).map {|tag_name| Tag.find_or_create_by_name(tag_name)}
      self.tags.clear
      self.tags = tags
    end

end

# == Schema Info
#
# Table name: posts
#
#  id                   :integer         not null, primary key
#  type                 :string(255)
#  user_id              :integer         not null
#  rating               :integer         not null, default(0)
#  title                :string(255)
#  slug                 :string(255)
#  text                 :text            not null
#  created_at           :datetime
#  updated_at           :datetime
#  answers_count        :integer         not null, default(0)
#  question_id          :integer         not null, default(0)
#  question_views_count :integer         not null, default(0)