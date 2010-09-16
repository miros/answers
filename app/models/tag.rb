class Tag < ActiveRecord::Base

  include Sluggable

  use_as_slug :name

  has_and_belongs_to_many :questions

  validates :name, :presence => true
  validates :slug, :presence => true
  
end


# == Schema Info
#
# Table name: tags
#
#  id              :integer         not null, primary key
#  name            :string(255)     not null
#  slug            :text            not null
#  questions_count :integer         not null, default(0)
#  created_at      :datetime
#  updated_at      :datetime