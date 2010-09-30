require 'spec_helper'

describe PostVote do
  pending "add some examples to (or delete) #{__FILE__}"
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