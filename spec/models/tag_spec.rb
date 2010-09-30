require 'spec_helper'

describe Tag do
  pending "add some examples to (or delete) #{__FILE__}"
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