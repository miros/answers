class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name

  has_many :posts
  has_many :questions
  has_many :answers
  has_many :favourite_questions
  has_many :favourites, :class_name => 'Question', :through => :favourite_questions

  def question_favourite?(question)
    return self.favourite_questions.where(:question_id => question).first
  end

end


# == Schema Info
#
# Table name: users
#
#  id                   :integer         not null, primary key
#  email                :string(255)     not null, default("")
#  encrypted_password   :string(128)     not null, default("")
#  password_salt        :string(255)     not null, default("")
#  reset_password_token :string(255)
#  remember_token       :string(255)
#  remember_created_at  :datetime
#  sign_in_count        :integer         default(0)
#  current_sign_in_at   :datetime
#  last_sign_in_at      :datetime
#  current_sign_in_ip   :string(255)
#  last_sign_in_ip      :string(255)
#  created_at           :datetime
#  updated_at           :datetime
#  name                 :string(255)