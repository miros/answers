class Question < Post

  has_many :answers
  has_and_belongs_to_many :tags

end
