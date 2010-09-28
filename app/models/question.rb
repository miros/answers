class Question < Post

  include Sluggable

  use_as_slug :title

  has_many :answers, :order => 'rating DESC'
  has_and_belongs_to_many :tags

  validates :title, :presence => true, :length => { :maximum => 200 }
  validates :text, :presence => true
  validates :slug, :presence => true, :uniqueness => true

  attr_protected :tags

  attr_writer :tags_string

  def tags_string
    self.tags.map(&:name).join(', ')    
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