require 'spec_helper'

describe Comment do
  pending "add some examples to (or delete) #{__FILE__}"
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