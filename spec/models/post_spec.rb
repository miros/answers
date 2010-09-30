require 'spec_helper'

describe Post do
  pending "add some examples to (or delete) #{__FILE__}"
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